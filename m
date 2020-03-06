Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E717B45D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 03:20:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YWYL6LDCzDqPW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 13:20:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.139; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=mnh5dSkU; dkim-atps=neutral
X-Greylist: delayed 705 seconds by postgrey-1.36 at bilbo;
 Fri, 06 Mar 2020 13:18:18 AEDT
Received: from mx01.puc.rediris.es (outbound2mad.lav.puc.rediris.es
 [130.206.19.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YWVy0LD2zDqtN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 13:18:16 +1100 (AEDT)
Received: from sim.rediris.es (mta-out04.sim.rediris.es [130.206.24.46])
 by mx01.puc.rediris.es  with ESMTP id 02626Jg8011643-02626JgA011643
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 6 Mar 2020 03:06:19 +0100
Received: from sim.rediris.es (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTPS id D9490395CF;
 Fri,  6 Mar 2020 03:06:18 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by sim.rediris.es (Postfix) with ESMTP id 88EDC395D0;
 Fri,  6 Mar 2020 03:06:18 +0100 (CET)
Received: from sim.rediris.es ([127.0.0.1])
 by localhost (mta-out04.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6nCRum6MqbsU; Fri,  6 Mar 2020 03:06:18 +0100 (CET)
Received: from lt-gp.iram.es (mrt-fw.iram.es [150.214.224.223])
 by sim.rediris.es (Postfix) with ESMTPA id 3D4D4395CF;
 Fri,  6 Mar 2020 03:06:16 +0100 (CET)
Date: Fri, 6 Mar 2020 03:06:07 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Gustavo Romero <gromero@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix typos in comments
Message-ID: <20200306020607.GA29843@lt-gp.iram.es>
References: <1583454396-1424-1-git-send-email-gromero@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1583454396-1424-1-git-send-email-gromero@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=LW6iXnJ0rHE87BL3g53rbVaF3tktZwumkRX+fbrX5yw=;
 b=mnh5dSkUN7ryd6gTDHzgjWzFhFurfrLs0Wg6pLRRnzQ/4hJq1dYYzc+JI3Vv5jX1cUPAJ4elBnaK
 oxuhzJ12TMoI4n1nTn4msrQ+V8gDl3gAnpF/lgKl9QDt4j5Ti+4M+h1TQFz3t7WuXOYD5SAnyn0B
 gsNJKwUUWVxcjtUhehZj4wZnkLI/6HIENe2PyjHh71PnlfUj+IcM5la26R3pZ3/ysl3ZPVGkpaVM
 mOd4yJoBJqM/iFf42sowsM/Lir5AnaXYCzwfyyP/zmMtb/Qjl4WXx1oKHFXYl8dWfCmU384fu/LZ
 kjB6b7SipOYvFrqxpatkgPm2RAeBcgWDA+r+Jg==
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 06, 2020 at 11:26:36AM +1100, Gustavo Romero wrote:
> Fix typos found in comments about the parameter passed
> through r5 to kvmppc_{save,restore}_tm_hv functions.

Actually "iff" is a common shorthand in some fields and not necessarily
a spelling error:

https://en.wikipedia.org/wiki/If_and_only_if

	Gabriel
> 
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index dbc2fec..a55dbe8 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -3121,7 +3121,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>   * Save transactional state and TM-related registers.
>   * Called with r3 pointing to the vcpu struct and r4 containing
>   * the guest MSR value.
> - * r5 is non-zero iff non-volatile register state needs to be maintained.
> + * r5 is non-zero if non-volatile register state needs to be maintained.
>   * If r5 == 0, this can modify all checkpointed registers, but
>   * restores r1 and r2 before exit.
>   */
> @@ -3194,7 +3194,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_P9_TM_XER_SO_BUG)
>   * Restore transactional state and TM-related registers.
>   * Called with r3 pointing to the vcpu struct
>   * and r4 containing the guest MSR value.
> - * r5 is non-zero iff non-volatile register state needs to be maintained.
> + * r5 is non-zero if non-volatile register state needs to be maintained.
>   * This potentially modifies all checkpointed registers.
>   * It restores r1 and r2 from the PACA.
>   */
> -- 
> 1.8.3.1
> 
