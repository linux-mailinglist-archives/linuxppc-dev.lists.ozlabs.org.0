Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F063B6EED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 23:35:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YYDy1fG1zF4nF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 07:35:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=87.98.178.36; helo=5.mo3.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 12576 seconds by postgrey-1.36 at bilbo;
 Thu, 19 Sep 2019 07:34:02 AEST
Received: from 5.mo3.mail-out.ovh.net (5.mo3.mail-out.ovh.net [87.98.178.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YYBy68lbzF1jP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 07:33:58 +1000 (AEST)
Received: from player758.ha.ovh.net (unknown [10.109.143.246])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 100732279E6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 18:44:42 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 270589FF1FDC;
 Wed, 18 Sep 2019 16:44:37 +0000 (UTC)
Date: Wed, 18 Sep 2019 18:44:36 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH trivial] KVM: PPC: Remove superfluous check for non-zero
 return value
Message-ID: <20190918184436.5323298d@bahia.lan>
In-Reply-To: <20190911195235.29048-1-thuth@redhat.com>
References: <20190911195235.29048-1-thuth@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6843782585976527154
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudekgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: Jiri Kosina <trivial@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Sep 2019 21:52:35 +0200
Thomas Huth <thuth@redhat.com> wrote:

> After the kfree()s haven been removed in the previous
> commit 9798f4ea71ea ("fix rollback when kvmppc_xive_create fails"),
> the code can be simplified even more to simply always "return ret"
> now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

This looks like a good candidate for trivial, hence Cc'ing Jiri
and adding trivial keyword in subject.

Reviewed-by: Greg Kurz <groug@kaod.org>

>  arch/powerpc/kvm/book3s_xive.c        | 5 +----
>  arch/powerpc/kvm/book3s_xive_native.c | 5 +----
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index e3ba67095895..2f6f463fcdfb 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -1986,10 +1986,7 @@ static int kvmppc_xive_create(struct kvm_device *dev, u32 type)
>  
>  	xive->single_escalation = xive_native_has_single_escalation();
>  
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return ret;
>  }
>  
>  int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *vcpu)
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index a998823f68a3..7a50772f26fe 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -1089,10 +1089,7 @@ static int kvmppc_xive_native_create(struct kvm_device *dev, u32 type)
>  	xive->single_escalation = xive_native_has_single_escalation();
>  	xive->ops = &kvmppc_xive_native_ops;
>  
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return ret;
>  }
>  
>  /*

