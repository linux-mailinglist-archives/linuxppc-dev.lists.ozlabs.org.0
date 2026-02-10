Return-Path: <linuxppc-dev+bounces-16775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCGUIeU4i2neRgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 14:55:49 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D595211B90F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 14:55:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9NPY2RCKz2xQ1;
	Wed, 11 Feb 2026 00:55:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::336" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770731745;
	cv=pass; b=TsokZS+PV9PmIgIXmgIL7AHVgT62Rjv2IhHwX2jIT+4w+eDzTwzKTzKBuBFk0CTD87LqDuUiwv89SN4CJ/4mR5/Ipnd38DPZFdfr49wxWow9aoTsWIAyxLXtoTX2fuWYG/j7ufTMJ5IPJO/uNmi2GglKM1HMKvq5Eqm2OjU5VFdEsSXfvng58eQ1Au3TKbR/z3RP5Q1u2IDPxcwcrr5G1Wt+EzLdw580iS/xugkcQXiWM2vNa5oy76wKsqEtSwhLor6w7u3lD4EbuRh5csgeE8xrOQ2lVlz1jpxzVYodW6giuemAoeghRGSraZIqKkmgapcnOc8ly+aqndPomTnR6Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770731745; c=relaxed/relaxed;
	bh=rXCYsv0h9Dcx7ZfhjKMFomiTtFLzzPoEUHbQkrHUzsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VqJQq93JEfdo4Es2pelWZDLDKtDFBb8GN7XtEB7597m4Z30kUp3HR6q0SMze5cndwMOZMrUa1VmnmDnceD6nih8rT9CPzk4Ax/GMS4yjaQgZOzkUAxA78a+q2DhgkKHIn9cxkjjv/lj23ypYq1yJrmCpQaXzo+898TsltXp4zV5vL4/JSuThCULcIcPzgdXdjzndspl0WTdASAczTl6yMd/aEwD7WUDpKsABCAqeLslSYaZE0X2EuT/a0s85BlKHP6RJGF3Uu9POaRjWrL/u/5fRu8+yDPNDrFGDlIGnmcpS9r1pek6z2wczgT079F59avVfKRayA2xY7OXoGeOVsw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=IYhjzjhq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=n7l8m4@u.northwestern.edu; receiver=lists.ozlabs.org) smtp.mailfrom=u.northwestern.edu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=IYhjzjhq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=u.northwestern.edu (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=n7l8m4@u.northwestern.edu; receiver=lists.ozlabs.org)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9NPW0cfcz2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 00:55:41 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7d1890f5cafso1463297a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 05:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770731739; cv=none;
        d=google.com; s=arc-20240605;
        b=dxBw3NFcYzWJ/Xe3y+OFS2+8dWmBZywWvlltz+YfFR7sTa6R94VsVoy/g9cs8XyHn3
         FFeDAy0J2ggq8Z4z0sUEbYF9SHdNcv5Be6iVBTpDX7Wvt3ii3AFY7zG/WkxGtGBEmVAg
         SDhpaw4qI8jkvwQmnFo9dznM76c5YToqR2z5qxPb1d1uth188dVfFJHz++kY9aqhBT2S
         q77gbb0g4IikSvXf9SOPqJX+UthZIRFyYdXuJz5exEDq0zMKzYsKy8GUTdP/sDSq6YZs
         Ey73/nmS+56s5avWoOf/ujRqrGJzum6QpaTCnNuNH2rqkZo14zEoMurjjxRAiTV/e8He
         gD8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rXCYsv0h9Dcx7ZfhjKMFomiTtFLzzPoEUHbQkrHUzsQ=;
        fh=8yr+iU54uSuW1MvQn9fRmYehJtzrAJV7ir5A53f1Lkk=;
        b=I2G3XS7t5Tebb5UvA+Pp4CYzfgpcxIRPRTlk4YtYWu+UgwXFEXa2qojOLqiXsR09z0
         KH3CX668UFWi4+N9Sjn1bC48CuC7pHrYlFbGYSS3TeuoVgow0rOPa5MjH2rbAWHgtUo+
         odYdjTX4gmmlcEX5b5LQ+5uY1n5K9l3K8KRg1JEpDkMGlJ3udtupmCKb5sy+sRc9s0oA
         JpJZp8WrYoxoP6GHq+PCxa7B/Oj4xq8lezS/R44zDmbc+jxwnQE+HwFP8/iaWv5GNNqT
         4fG+8OsejMsTFZSwF1k1p3Y4M9Zw122Z/RUkOVREYcFs5EtE7RzTAuho/iiDm84IC08J
         f1LQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1770731739; x=1771336539; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rXCYsv0h9Dcx7ZfhjKMFomiTtFLzzPoEUHbQkrHUzsQ=;
        b=IYhjzjhqv4UxyNHmNWSJiuf7ACnmIxFEac/VfAllfvooVRctyFBK6Y3v4Oo76U4DWy
         0SN6WN6zw4QmJUl253bqM8IP7iEdWeJ0aGJ26a3DNgpDRFI/jE2QWGZEeQWa+zhey6pO
         +F6xjU6+MCY2amhmOoNIUpR/Hpu0aLyXkKbjtWUzqrPkdt05yyKVCzZQSFKs4Wh+cug0
         zty88QgsZGPB9ICYneiiiVVeNAVcI+bsnm0HNn/sqg5mFwVCZMEzBUnMr/1/WgJVRjpb
         IyAC+6xtZ8WjrVcjVkaZFba2Jp5381LLCISfFVYX4sIjL+K30Blkb6l3s9GmhgrRUdWm
         1riA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731739; x=1771336539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXCYsv0h9Dcx7ZfhjKMFomiTtFLzzPoEUHbQkrHUzsQ=;
        b=iODIhwZzM7D2rMw07+WjLeKHrF+azIY3MwdaU5Sejnec9Hr1mujjSlVtbeSdMbZtG5
         Ygb2dQL1j9D4bdEb39CMIYBQGy5wYGZDmRXULQG9AhB1+EwCiqVGNyERPvyaN9xNVzLS
         xexlDD60+JyM+r4LcAIyf9yUwa6RqBsFJiy4yI0wjZDVEWdyLM5wshfh6Z5pgFCQuLkv
         /DUkySNDOa5eCOOsFG6C2T6hyuSiGQKeSzlizFD6RPDnXR8nbjIjbqWWM764D42+C2kY
         rAHw5b8L2gmgo8uOV4sxUTVa7PwOMyomZMtl6Qc1SiXHmoZhZGLK+1pFDAVlYQjMiVOB
         I9+g==
X-Forwarded-Encrypted: i=1; AJvYcCUOnMSVMAbLJkg+/QeJiLFJW1W08FGwbdutCcn5aLq/zSs+Di513azFg6RKbf5x3tOvqfCMn+kZLJs6Ft4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPci5DAkaW+x8VLOejFfYY0mVM0TSgpD/AILbTdi+byJc21Gup
	SC6o2l1hT6JwKLjHUez7GgTVsu5TbxLQtPoWAsAqDaozYruHJBln3edtOtYFyY5xm+3c6QMBUL0
	m2VSahI6Tc7eVBsc9VSXtOaWXxCAonswk+OwygTpEfQ==
X-Gm-Gg: AZuq6aJwFe5zyLcPMalmzE8M1wAScifQapSZB/GkanhR8A4FNuFLRcwxieM+llCY1WM
	eHan8iC8R8fciLaXrJSiyx7E6p98+2kj7DjUdYKkvYI11XV7tyzQKZ6bLW33eUy2DlP70pX1lp/
	lfPcRtos51mLbFn2DHwpaaa0FxAhgNn3bvLfxgAD0/iHMEi6xIlpFs57V08v4FbgFSrgP6Ly1PO
	TUN2TRD9+AHEdgFjIoYY3jypMD6nfNhQZCF/19no+isbXQ4Yj3TstXPPYVQfGT4WWT0kIYKmTua
	N7GNGFl4BN48IFzzvSF7jdOA81q/IY6SOVyALbUizAHFShQ8Z0Eu3B+QdSTwFBgwDN90Chna
X-Received: by 2002:a05:6830:6a9b:b0:7d1:94d0:e8f1 with SMTP id
 46e09a7af769-7d4644294d4mr8355464a34.15.1770731738773; Tue, 10 Feb 2026
 05:55:38 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260202174112.2018402-1-n7l8m4@u.northwestern.edu> <5056506.GXAFRqVoOG@steina-w>
In-Reply-To: <5056506.GXAFRqVoOG@steina-w>
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
Date: Tue, 10 Feb 2026 07:55:28 -0600
X-Gm-Features: AZwV_Qgn409JcyKfCJ9Y2iSAHnNv868P9lwiucSfI8dxwC4J1Cd0Lrp-pLGta9c
Message-ID: <CAMFT1=aJa92RO4j8ipcRc0NJ7DjAvgStkTiSx-QsrqQQzqkV=Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: fix missing lock in fsl_xcvr_mode_put()
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.stein@ew.tq-group.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[n7l8m4@u.northwestern.edu,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16775-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid,u-northwestern-edu.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: D595211B90F
X-Rspamd-Action: no action

>
> This lock causes a blocked task on my TQMa8MPxL based board:
>
> INFO: task alsactl:1969 blocked for more than 120 seconds.
>       Tainted: G        W           6.19.0-next-20260209+ #3331
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:alsactl         state:D stack:0     pid:1969  tgid:1969  ppid:1      task_flags:0x400100 flags:0x00000a01
> Call trace:
>  __switch_to+0xdc/0x120 (T)
>  __schedule+0x258/0x790
>  schedule+0x30/0xb0
>  schedule_preempt_disabled+0x20/0x40
>  rwsem_down_read_slowpath+0x214/0x68c
>  down_read+0xb0/0xb8
>  fsl_xcvr_mode_put+0x4c/0xc0 [snd_soc_fsl_xcvr ac1b31380c6a6ea0d613bd5f78489e314a40f91f]
>  snd_ctl_elem_write+0xdc/0x180 [snd 852e63996474051c57bcd1a86ebfd81083073853]
>  snd_ctl_ioctl+0x7a4/0xaec [snd 852e63996474051c57bcd1a86ebfd81083073853]
>  __arm64_sys_ioctl+0x9c/0xe4
>  invoke_syscall.constprop.0+0x58/0xcc
>  el0_svc_common.constprop.0+0xac/0xd4
>  do_el0_svc+0x18/0x20
>  el0_svc+0x24/0xa0
>  el0t_64_sync_handler+0x98/0xdc
>  el0t_64_sync+0x154/0x158
> INFO: task alsactl:1969 <reader> blocked on an rw-semaphore likely owned by task alsactl:1969 <writer>

Thanks Alexander for reminding this, it seems that in the context of
the whole put operation, the lock is held through upper ALSA core
layer, so we don't need to add lock protection simply for
fsl_xcvr_activate_ctl() in the driver layer.

Thanks for your time and apologies for the inconvenience. I think we
can drop this patch.

