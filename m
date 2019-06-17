Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C104781E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 04:08:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45RvlD067NzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 12:08:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Rvhq3Lj8zDqYk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 12:06:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="iKIkMtWu"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 45Rvhq2czdz9s3C; Mon, 17 Jun 2019 12:06:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 45Rvhq1xMXz9sBr; Mon, 17 Jun 2019 12:06:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1560737195; bh=oCQDQTZLySOsNpFkc0RCedPxkKTKkLOJdYTa6K/YZmw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iKIkMtWu0qozAuAIchTQg8kWDplAc5IgvaAPRhr1iRDkdjkookK0pYnQkp85uADDD
 Y2ypCoFLvSzDpGtSBThmOLIr0hKojL2Z4NF85cdGBWMzANG+5wADlQmOr5uWZxe3Rn
 S7wMNbtE/9YKCaGH8e1eUywz3w81L3q2TAYm5zH4tvNEzf6fzhynrB+ZdN++e99h8Q
 cr1Z0M4ub9FtRmVF1TLeKadxukW2lE7dENSGzFjc0uNdLp2NweSSeQPE5e0oR+ZjD9
 Je9Jq5uKOgK+E6fHoSEZ5AJdCyvkNBL8wujL8iLvQ8uVbgo3l1rG24qfVtqehAKPk6
 pZsfYv8Nk9sgA==
Date: Mon, 17 Jun 2019 12:06:32 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Claudio Carvalho <cclaudio@linux.ibm.com>
Subject: Re: [PATCH v3 4/9] KVM: PPC: Ultravisor: Add generic ultravisor call
 handler
Message-ID: <20190617020632.yywfoqwfinjxs3pb@oak.ozlabs.ibm.com>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-5-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606173614.32090-5-cclaudio@linux.ibm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
 linuxppc-dev@ozlabs.org, Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2019 at 02:36:09PM -0300, Claudio Carvalho wrote:
> From: Ram Pai <linuxram@us.ibm.com>
> 
> Add the ucall() function, which can be used to make ultravisor calls
> with varied number of in and out arguments. Ultravisor calls can be made
> from the host or guests.
> 
> This copies the implementation of plpar_hcall().

One point which I missed when I looked at this patch previously is
that the ABI that we're defining here is different from the hcall ABI
in that we are putting the ucall number in r0, whereas hcalls have the
hcall number in r3.  That makes ucalls more like syscalls, which have
the syscall number in r0.  So that last sentence quoted above is
somewhat misleading.

The thing we need to consider is that when SMFCTRL[E] = 0, a ucall
instruction becomes a hcall (that is, sc 2 is executed as if it was
sc 1).  In that case, the first argument to the ucall will be
interpreted as the hcall number.  Mostly that will happen not to be a
valid hcall number, but sometimes it might unavoidably be a valid but
unintended hcall number.

I think that will make it difficult to get ucalls to fail gracefully
in the case where SMF/PEF is disabled.  It seems like the assignment
of ucall numbers was made so that they wouldn't overlap with valid
hcall numbers; presumably that was so that we could tell when an hcall
was actually intended to be a ucall.  However, using a different GPR
to pass the ucall number defeats that.

I realize that there is ultravisor code in development that takes the
ucall number in r0, and also that having the ucall number in r3 would
possibly make life more difficult for the place where we call
UV_RETURN in assembler code.  Nevertheless, perhaps we should consider
changing the ABI to be like the hcall ABI before everything gets set
in concrete.

Paul.
