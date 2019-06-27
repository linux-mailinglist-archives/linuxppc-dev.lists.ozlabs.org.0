Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA5658B62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 22:04:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZW7z15g0zDqjn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 06:04:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="FX032XFU"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZVxt20WgzDqkP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 05:55:46 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id n11so3840224qtl.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 12:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hfC5ksK/27L7g+gphc+1CirxCd90pDX9jOTKCz1pz8E=;
 b=FX032XFU1FEy5o1G1ny4HF81Jkl0PmBCXyXoTWiPPCO4Px86xkOmT20mjbjWJ7mAaB
 gdnJDtceV7a6Vwl5civebrg8rKxMhBMhJhDrkMbnlXJXXV88Uhfa6ufOnmxtlToTAo9d
 6l9NgiaUkt2ZGb2OYru+H2aWa3yhwO/rrxy5lg3OoU1ZJ0MxY2yq6elR6b/eBNawBske
 Z6RLumSPzTQTRP+i9nfmzfYS0fcHMJ1ep8qhJnY61y9hY178VNZEMEli8p0P4gCrOkDN
 odJALjYbg85GmHnuO0FTS7RG20N1ajNRUu/bW0Qoian5Sj49Q9Y1TG4InCLvqRFOVRhL
 Go4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hfC5ksK/27L7g+gphc+1CirxCd90pDX9jOTKCz1pz8E=;
 b=OnzUS437yN9FiFVgdUcLQ2QP3JcAvELBkCe6baKiJUlSD6UkkYMhtJvSpIGPHI5RVK
 LAcXfAG779aAIa3qKOSQLjJgz2VFYUCMoE8eVjwBRCPOjf+nA8cw8UY/bEW3tbJc3dbj
 cuNz9RLbrJP8zvGvuj6BTHaM9+oxDnxrU4Dc1rVTVwlf1B74dQ8t4COvXa1ygkb7NC1c
 8Lzje2dDBlhvUrV8oWP6C2VtdNQolf25/D+Fi0QKPq6J0UdwFpxbzCIZU+wvCYKtcW+1
 c2KFlPjjXNJt1myjFDYTHS7tXsLOsTwbGjP3HvYBYX4Ip/FPB5yHbORXpDqBFxz0hHsR
 l/VQ==
X-Gm-Message-State: APjAAAVatDBRGJGBwHGFWaBiT0kzO4abJ5Q5Kl2yV3laONYBGxIJuApI
 f9pcKRby2dDHep4ZTl4dYwU7zg==
X-Google-Smtp-Source: APXvYqx62wNXdlmsPb5THkuZIKClAG6aQwB4J9Ba+Vjn/LH6v5Y9RCJZlJofdtZlE0wrf/W7HR8j2g==
X-Received: by 2002:a0c:9687:: with SMTP id a7mr4972347qvd.163.1561665341568; 
 Thu, 27 Jun 2019 12:55:41 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id k55sm47300qtf.68.2019.06.27.12.55.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 12:55:41 -0700 (PDT)
Message-ID: <1561665339.5154.92.camel@lca.pw>
Subject: Re: [PATCH] powerpc/eeh_cache: fix a W=1 kernel-doc warning
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Date: Thu, 27 Jun 2019 15:55:39 -0400
In-Reply-To: <1559767579-7151-1-git-send-email-cai@lca.pw>
References: <1559767579-7151-1-git-send-email-cai@lca.pw>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: sbobroff@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping.

On Wed, 2019-06-05 at 16:46 -0400, Qian Cai wrote:
> The opening comment mark "/**" is reserved for kernel-doc comments, so
> it will generate a warning with "make W=1".
> 
> arch/powerpc/kernel/eeh_cache.c:37: warning: cannot understand function
> prototype: 'struct pci_io_addr_range
> 
> Since this is not a kernel-doc for the struct below, but rather an
> overview of this source eeh_cache.c, just use the free-form comments
> kernel-doc syntax instead.
> 
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>  arch/powerpc/kernel/eeh_cache.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
> index 320472373122..05ffd32b3416 100644
> --- a/arch/powerpc/kernel/eeh_cache.c
> +++ b/arch/powerpc/kernel/eeh_cache.c
> @@ -18,6 +18,8 @@
>  
>  
>  /**
> + * DOC: Overview
> + *
>   * The pci address cache subsystem.  This subsystem places
>   * PCI device address resources into a red-black tree, sorted
>   * according to the address range, so that given only an i/o
> @@ -34,6 +36,7 @@
>   * than any hash algo I could think of for this problem, even
>   * with the penalty of slow pointer chases for d-cache misses).
>   */
> +
>  struct pci_io_addr_range {
>  	struct rb_node rb_node;
>  	resource_size_t addr_lo;
