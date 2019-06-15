Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B799C46EC6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 09:43:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QqG308l6zDrWX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 17:43:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Qq9P5XLmzDrdZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 17:39:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="HVi9H+S4"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 45Qq9P3HdYz9sNk; Sat, 15 Jun 2019 17:39:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45Qq9P1qmmz9sNT; Sat, 15 Jun 2019 17:39:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560584345; bh=jJrBcz383cyzLtbHZTqELCISI6z/er7Ec5RzoNiO7Dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HVi9H+S4FU54amSAnfO8034hu+3F4tiNGpRBBNBoOw7v3Q90a42Y1pehOKAt3FVII
 Q/wpp360CEBGgZIsjxdBjt2UKNaMkVwUKyxa1ahrBNozA9eAiL8eVBNX6WF2yihPZM
 ENd9Lb1A9MMUyBB5hmOaXfolFATOE+ThKxkr/sdacM4HAj3ZGmNV94m7jFfPkDoThH
 9psc85W25l16pzHjsSzq/9axy74yEARUShhFhkJ3UQONUfN7Wg3WTsFzZ+YGPf+C0k
 eIIZmf6CVciKHJwxhuTepsENsRGkyaAiTlGnoApDxmjIgeoeB6eTOwge8Npq1NSlBv
 JE0Zlpy76P3Wg==
Date: Sat, 15 Jun 2019 17:38:58 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v3 5/9] KVM: PPC: Ultravisor: Use UV_WRITE_PATE ucall to
 register a PATE
Message-ID: <20190615073858.GC24709@blackberry>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-6-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606173614.32090-6-cclaudio@linux.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Ryan Grimm <grimm@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2019 at 02:36:10PM -0300, Claudio Carvalho wrote:
> From: Michael Anderson <andmike@linux.ibm.com>
> 
> When running under an ultravisor, the ultravisor controls the real
> partition table and has it in secure memory where the hypervisor can't
> access it, and therefore we (the HV) have to do a ucall whenever we want
> to update an entry.
> 
> The HV still keeps a copy of its view of the partition table in normal
> memory so that the nest MMU can access it.
> 
> Both partition tables will have PATE entries for HV and normal virtual
> machines.

As discussed before, all of this should depend only on
CONFIG_PPC_POWERNV.

Paul.
