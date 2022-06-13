Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7673E549998
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 19:15:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMJ983KPMz3c8S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 03:15:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F9Dmyjwz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=F9Dmyjwz;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMJ8V62YLz3bhs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 03:14:32 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 129so6118858pgc.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 10:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q3ll5jEP2t2CsOV5mJ9Lm/eNFB2SHb8fwGUCCDQrsO0=;
        b=F9Dmyjwzv2BEelHz7PJex+FuAbmYcPkwAbOQWV7DkB6t+QTRrVMnlcX6ZYZwZOjH8E
         9y5wWh+yhRfIpe69TakkGIbElqr5S2LK6a9iqYRNZAq85N9BEYBPmuaqLwdKgBO5mXU1
         uFtWLQc+4ZR54mskxEeTmr1fDcj55QLyl1l8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q3ll5jEP2t2CsOV5mJ9Lm/eNFB2SHb8fwGUCCDQrsO0=;
        b=HH9+ow5vPtKqlwJr8iwMeQSVUnmzWF2FssmQCPsIOqAx0s14nng21nLpYY/wV3Ny/y
         AD1nwdnYj2538e9JL/VKRay8OV+qyPiYE8XwNT2n1CRwRIGeY8QCbH8jJK3YiUWcLpwW
         Pd7KLswY3XrodAyNRsryS5xN/IdGCI0vkL0TiJa2GhfDCoshNjb1tkqScx1xm0LaII8m
         SKDLjMDk9T4pfq92/3j6LsTe7ngHP0+lWDU6jW+aHDu53jNe00g78Q1bmeUWYSBWurXK
         ZXh8HbDrFf0zYT/HoKbK/nUj3Fs5I9z6SBMH35qysxlfmcnVlw82lDy0cuJazPVAcBKb
         jwTQ==
X-Gm-Message-State: AOAM532EDKM83RZZ+RoWP4qc4DvaKdy0HY+G2qqMfzDQipUwyzK9K0+c
	ypVm4CGyJ0wWOBcWJHe2G4NPTw==
X-Google-Smtp-Source: ABdhPJyID9xIthmByLOSbmLQ+hZGxlQijKuPUli3jnD6NTly8DKqdxatMXFTWRIwuHQv0whCqlLxfA==
X-Received: by 2002:a62:140c:0:b0:51b:bd14:6859 with SMTP id 12-20020a62140c000000b0051bbd146859mr346192pfu.28.1655140467272;
        Mon, 13 Jun 2022 10:14:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id iz3-20020a170902ef8300b0015e9d4a5d27sm5407597plb.23.2022.06.13.10.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 10:14:26 -0700 (PDT)
Date: Mon, 13 Jun 2022 10:14:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Restore CONFIG_DEBUG_INFO in defconfigs
Message-ID: <202206131014.B0552BDB8@keescook>
References: <98a4c2603bf9e4b776e219f5b8541d23aa24e854.1654930308.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <98a4c2603bf9e4b776e219f5b8541d23aa24e854.1654930308.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 11, 2022 at 08:51:57AM +0200, Christophe Leroy wrote:
> Commit f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO selectable from a
> choice") broke the selection of CONFIG_DEBUG_INFO by powerpc defconfigs.
> 
> It is now necessary to select one of the three DEBUG_INFO_DWARF*
> options to get DEBUG_INFO enabled.
> 
> Replace DEBUG_INFO=y by DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y in all
> defconfigs using the following command:
> 
> sed -i s/DEBUG_INFO=y/DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y/g `git grep -l DEBUG_INFO arch/powerpc/configs/`
> 
> Fixes: f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO selectable from a choice")
> Cc: stable@vger.kernel.org
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
