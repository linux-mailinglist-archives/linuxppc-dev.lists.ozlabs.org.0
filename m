Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A861123C4F1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 07:17:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BM0HK6WyRzDqdc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 15:17:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AFmxb7f8; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BM0FH1n6HzDqXv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 15:15:30 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id z188so14157962pfc.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 22:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/n77pfE4a+GOKvicmljT/QtRWcD5OcaFIdllbQ5Y/wY=;
 b=AFmxb7f8d9u4khyrON5HeLJwb1Qw5QvNvEXE0doBoJbYvgEvXafs8WeN9n7auMuuAF
 VXPoMIf1mSknY/cVdcBCMW8L6eBpi4J7dwrN5Zi5PLjH2PUm8Lm7V2AYxw+rb8ThXBik
 KLVB5HrUo+2v2qtsNCpehTNZab+H5ACdib6DdIPEi78GG/7snFgF+lh5TBGT6HNOd3xU
 ynDWad+UVkv0Xo5MvddZnnu5tENt9XHaqz9D1HtZzAGoWAnepvaHLfsVnBRgKBv6RWsk
 USORzkHoGh/7EGz5XAWvITM5OjG1m4qrxdoQSKJAubGvkJ+0kEmsUD31VGsdMKqjH5++
 mSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/n77pfE4a+GOKvicmljT/QtRWcD5OcaFIdllbQ5Y/wY=;
 b=sR+23mJcyI622UoY8xHPkgfKKmfMy5R4jiU+MAZ8JBKDrNmI5CMQGEnsYV2NyajZ/7
 SGFI2CeqhmD3HuHMVbbyfXUPZe0mcAUSUT61FG1+pbug0wcNkLqwGj/+YuMU97c1udmJ
 VevwGiomDiY3JMmqKwdzZDG2ko1b3wNLgoOmpLvZy6+HLbc6cqYTo+rpwCi2hVMztgTT
 YneAL4kRBq5bCpVbphM4B5AW2Fi79XxlSy6odtNOGp+0ViHMFW1eP3KB8U1ANacVSZgc
 Es+6xlbrBExtm0XqmniRTE/vWjxKhbPyHiLeAC2ZJiPtPnffibAbDM/5m1xu4VuQrBo+
 MymA==
X-Gm-Message-State: AOAM533KfAlNUfZWqOBOXTZfVTkyWaU5ozkBBOVB8cSFPiYxjNjpB7wC
 vf8eDXocUPUetWnG6NCjv6c=
X-Google-Smtp-Source: ABdhPJznedC2BZI3gT80R+gKb4MGfnESYyp4nkwqsAQ81pws/5kKeVDVr8qut1B0dpAbnle7RGQ0Gw==
X-Received: by 2002:a05:6a00:14d3:: with SMTP id
 w19mr1664143pfu.92.1596604526362; 
 Tue, 04 Aug 2020 22:15:26 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id h5sm1322799pfq.146.2020.08.04.22.15.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Aug 2020 22:15:26 -0700 (PDT)
Date: Tue, 4 Aug 2020 22:15:12 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_sai: Refine enable and disable sequence
 for synchronous mode
Message-ID: <20200805051511.GA29129@Asurada-Nvidia>
References: <1596594233-13489-1-git-send-email-shengjiu.wang@nxp.com>
 <1596594233-13489-3-git-send-email-shengjiu.wang@nxp.com>
 <20200805041111.GB10174@Asurada-Nvidia>
 <CAA+D8ANv-qURC_wu3TzWiiiCAXC88Gc+WGssdjmuWoLPTRm3pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANv-qURC_wu3TzWiiiCAXC88Gc+WGssdjmuWoLPTRm3pA@mail.gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 05, 2020 at 01:03:37PM +0800, Shengjiu Wang wrote:
> > Btw, the new fsl_sai_dir_is_synced() can be probably applied to
> > other places with a followup patch.

> Do you mean move it to the beginning of this file?

There are other existing places testing "sync[tx] && !sync[!tx]"
so you may submit another change to replace them. But, yea, will
be a good idea to move that helper function to the top.
