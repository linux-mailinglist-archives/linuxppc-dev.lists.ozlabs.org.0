Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60928BC19B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 08:13:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46crTX6nXxzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 16:13:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46crRY4PmwzDqS1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 16:11:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="aU6IZvHX"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 46crRY3Lxhz9sPJ; Tue, 24 Sep 2019 16:11:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1569305481; bh=+d6v8WYT+viMPFD2AWLGwcmMQ+4R+NXR5ZEghf3P1oQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aU6IZvHX7peJwFrvLpLb4d4Rq7NOx4C3Xfu5QMsFWUDXrPDzRxrR2xjsTGADYl0K8
 MnaReMA1X0jD+ZyOKngJg4BXWfuS9k9w4+9nkxdM2Pt3RHPfUA4lcYGSF60z1z1m0o
 4QKFtHjQb0zy/Uxqd89j9jTTobsIJqBO6c/uGSw7JNk2fjpdhUpHYSD/U1nbhJQri7
 406r/sWU8/2YHhrmPYydnf8amrpG2UAy97Kv6LDfF7bBUe816SOdsb4IfXlQPaLHcS
 pWYOEgJmja/x5psdPesNoZc59khZeuGEfvnwJ1y4C1utFwgVNWNCrmlbav5P6etkxB
 ppyMrfzVUWFYQ==
Date: Tue, 24 Sep 2019 15:33:28 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 3/6] KVM: PPC: Book3S HV: XIVE: Ensure VP isn't already
 in use
Message-ID: <20190924053328.GB7950@oak.ozlabs.ibm.com>
References: <156925341155.974393.11681611197111945710.stgit@bahia.lan>
 <156925342885.974393.4930571278578115883.stgit@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156925342885.974393.4930571278578115883.stgit@bahia.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kvm@vger.kernel.org, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 23, 2019 at 05:43:48PM +0200, Greg Kurz wrote:
> We currently prevent userspace to connect a new vCPU if we already have
> one with the same vCPU id. This is good but unfortunately not enough,
> because VP ids derive from the packed vCPU ids, and kvmppc_pack_vcpu_id()
> can return colliding values. For examples, 348 stays unchanged since it
> is < KVM_MAX_VCPUS, but it is also the packed value of 2392 when the
> guest's core stride is 8. Nothing currently prevents userspace to connect
> vCPUs with forged ids, that end up being associated to the same VP. This
> confuses the irq layer and likely crashes the kernel:
> 
> [96631.670454] genirq: Flags mismatch irq 4161. 00010000 (kvm-1-2392) vs. 00010000 (kvm-1-348)

Have you seen a host kernel crash?  How hard would it be to exploit
this, and would it just be a denial of service, or do you think it
could be used to get a use-after-free in the kernel or something like
that?

Also, does this patch depend on the patch 2 in this series?

Paul.
