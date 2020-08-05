Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE023C450
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 06:13:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLysJ1LdYzDqS4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 14:13:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gbgGmYgF; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLyqM3QpFzDqHR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 14:11:27 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id u10so15038464plr.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 21:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hxlzhilvpbhmfegLmBqfpD7CzDK63zsBFUHMpLeOrf8=;
 b=gbgGmYgF0YdpUhrBT8h1liSj6kuTwlC09ocfWaO9eU591HVmlnn6hPetkmf8DTum1C
 C846wjQ71ar6b4ov/10B1KDvxHju+an47hQbzDQUasqRTkIZZCGe0LixtP1tlZ2Z3hHn
 AQznHxv1cBeKx0Urr4pBV6hGdRKoF6luQGbvpgrkaR4s67QjIW9QcDZ75tJ4RaFZWfNM
 D/nME9nSSyN3Hm79JBIdOZT/dgrKl/Z7u/BgmLir2lxu+p40to+W0krkBfzmUkt/D1A3
 OO/X4H8EXfiPS4XFlwKi0TS5vJ+dtgfdSeyAfIMR+w1b9+/YoYD04ANWhfZ3RYyNIx+n
 PBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hxlzhilvpbhmfegLmBqfpD7CzDK63zsBFUHMpLeOrf8=;
 b=HAWEhOxwb9JkRAbcu2ZrO5zmZdytkyVQ8j+RDP9VmoPYlETKek3XWUZJUuJm2BWzJ8
 IcJO+9Wt49wHx7t8oqgCjDuTbNrSRrGmuhfE5QTypMHkxtwLULr6h8VR+lIOhsS7ss/L
 jBdHcXmYm/4Bd/f1RwEeV0pU7nm5m+rXFmqfmKELwARgftBG6s2ObG6Fg8tkC4fMtXld
 EHF7I1haVJMnNLVbg02sMd39P34bG6MFDjYDczBvrLAL1DHNkxJ2RARIdepfx+3vgjNn
 FSvVEXQtSbSvhKGmdd8fk+vwq5+R2WXLV+JwDe6HyItpta6wnnipoeJvUf0n0W0kzwFx
 uKFw==
X-Gm-Message-State: AOAM53132A3NDwdtSxpRfe5IScZ2zZ49ljRpDx8n9r9xGo3C+SThZHqk
 oU7bettVgv8E/jYUDf3Wsdw=
X-Google-Smtp-Source: ABdhPJzpXE7rX9+PiFNYZWRcw3RheNt5DShOYBGze0ylmEzhCuKl6oc5Z0S0RvMEH6h/H7A7bvvoOA==
X-Received: by 2002:a17:902:9001:: with SMTP id
 a1mr1377741plp.124.1596600683704; 
 Tue, 04 Aug 2020 21:11:23 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id x127sm1108891pfd.86.2020.08.04.21.11.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 21:11:23 -0700 (PDT)
Date: Tue, 4 Aug 2020 21:11:11 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_sai: Refine enable and disable sequence
 for synchronous mode
Message-ID: <20200805041111.GB10174@Asurada-Nvidia>
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
 <1596594233-13489-3-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596594233-13489-3-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 05, 2020 at 10:23:53AM +0800, Shengjiu Wang wrote:
> Tx synchronous with Rx:
> The TCSR.TE is no need to enabled when only Rx is going to be enabled.
> Check if need to disable RSCR.RE before disabling TCSR.TE.
> 
> Rx synchronous with Tx:
> The RCSR.RE is no need to enabled when only Tx is going to be enabled.
> Check if need to disable TSCR.RE before disabling RCSR.TE.

Please add to the commit log more context such as what we have
discussed: what's the problem of the current driver, and why we
_have_to_ apply this change though it's sightly against what RM
recommends.

(If thing is straightforward, it's okay to make the text short.
 Yet I believe that this change deserves more than these lines.)

One info that you should mention -- also the main reason why I'm
convinced to add this change: trigger() is still in the shape of
the early version where we only supported one operation mode --
Tx synchronous with Rx. So we need an update for other modes.

> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

The git-diff part looks good, please add this in next ver.:

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>

Btw, the new fsl_sai_dir_is_synced() can be probably applied to
other places with a followup patch.
