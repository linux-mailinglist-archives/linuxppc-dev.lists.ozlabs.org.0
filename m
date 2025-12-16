Return-Path: <linuxppc-dev+bounces-14789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50BCC14F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 08:33:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVpYm5k8xz2yDY;
	Tue, 16 Dec 2025 18:33:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765870380;
	cv=none; b=Po6KH3+mV4phgSF0ZgnU+bwtaRcVRwkwd69Aj5Mc+E03uy9ywed/iZ/9YzVld68309OgiX3kcxylsJ1Tkt33LgyvxJzAdUyGrOnNNgDe6RLR87cSZ7SUBttB2/1zTLDnVN1VPO4YV+Uo1Z00n5AhcR+Kc7b3Q9LxVPzWlzU1AWIV7ZeomzivXR0k461DMaxqQC/+yRIiQfkLuCSVJ/jeL6GkN3bpDsclOu6tcLjnOpwTBpbJrdUV8t2vdiMoSW5UOsRdXkxa6Q5ix9YbRxqrLIn69KBIYRjfDHdr0i7006SSfpPBzC1Qrvh5PMNYxzTGiESw27dU3UlzyAwM15ykow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765870380; c=relaxed/relaxed;
	bh=56pDNBRnCd8IeTo2aYkwkfbBEAXuU0fbTgxbB6X8B5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VLMiB65dTLd6mLDlZM2AxZjuiH5mjsBl5DEw4vOTvtGHYPSPIGRBmbPm39VNQwmDU5SVRoW2bxL39c8j+3lhRdKQmobS9CuQOflAakSINIOLa649qIO4ktFYCmWbWflx67fiHAjE2/1lKXCX1eafKeEz41LjwzbGpms5/7HB6QjbEW9B/FZgJtfdpGt8fnXB0B53YH8K2UABmDu1suvo3YlH2uQcqZ0/kFtb32oW0iTmzLiopC/370FfgBN27j4JO5UJ2DNw7fPPAbRSWGJXQiUPulS1NMl0tWLJK9VMxT/dlBb1ytBm6OL3D7495IjPQpZ1ofZdpG6eidT5siXpAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NgAOMTtE; dkim-atps=neutral; spf=pass (client-ip=209.85.167.177; helo=mail-oi1-f177.google.com; envelope-from=hanguidong02@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NgAOMTtE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.177; helo=mail-oi1-f177.google.com; envelope-from=hanguidong02@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVpYl1b9hz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 18:32:58 +1100 (AEDT)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-450b5338459so2665026b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Dec 2025 23:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765870315; x=1766475115; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:sender:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=56pDNBRnCd8IeTo2aYkwkfbBEAXuU0fbTgxbB6X8B5o=;
        b=NgAOMTtEgYIdp6yuMOhZ6DSI9dvzgj+hwozle6jIDAet5cmr4hAYONKSeUrv9t/lCf
         qSASr4xoxNPJC4MCu01eXROaCFhK6CjzU3ErUODoyLPx9XW2FNGNqlBfBsJVYUCzDOJM
         waM/gchqq5EYV++ZY1fdwWpU3JBbN7c9lz0nmapeW2t4yABTaSExTy+31Nh9POyTntk2
         fiMDLnHClBkT/c05abyyFxzXTIe4WEL/SEgq7aqn5WVZc28zI+O5GIF10OiGSyA4UGpW
         fsYF5JNzzGzwUDNOEFwNPaRaanCcbVxKcSvMotjH8y0GR3BrlV8rX147XDwAqpTMhfuh
         4DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765870315; x=1766475115;
        h=cc:to:subject:message-id:date:from:x-google-sender-delegation
         :sender:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56pDNBRnCd8IeTo2aYkwkfbBEAXuU0fbTgxbB6X8B5o=;
        b=qBISSCtJExMKLOUhCYxgZdY/eNUCl4CIylY6xAwMD4HvVFjC1554tLc0tpaFXdz8xN
         Y3oSZzj6AU4TpVNg764JJ/34M15JY8e+Uh9ha5JkmANzSROuEkdsV6tux2yOjpMsLXJT
         uwoPVcFFXh7GFPnGmZ1BkDRj+6BmWS6x8mdTFDDEK1YU1pi7pO+jKACF5eJ7fgCFAZB9
         PLd8QPzDeAPWM8WVLibr/JXYkPfaMgnPlo8IPDo4Ct0iim3jgqdiFFAiZ4fO3v8suebG
         sROtNW7yeiV1gvgxnpFYCSL4kVl1gzQMbha3TipHhNZeU/N56kfNhNfmtk4+CRbQ76L8
         V4jg==
X-Gm-Message-State: AOJu0Yz35r+daSbF9LeSJJCCesVCjeCxPT2wWXoqwFV8EQsXawdW7p44
	MJt3R/C+VGY4LTsxrNE+kk/tKNf4BwSDWl9ab8DWLmVJyaAiBDXYq+XTs7Kpf+qbWSGXKIpXAj0
	Lrhwl/35Pz/NLCSQoPLv2Qf+gl03PD9M=
X-Gm-Gg: AY/fxX6Z1Z3oqq7Q578rBt1k9FzYK7qqQF8+AH04erdKBsbu3Q2Fc9YVOMqHmUgq/BQ
	EgyoNuKwFPBo3IlZylScriPKbuI+ACPDKuiwWJT/q5obHNgfMJ+1NOwoWMg0vutCTBA57xBz7gB
	vdnGQfpy+dIhag20RYKxSTqewRbpHz+YW252sBEGKNgbJqZPrkYsQpUDI1gDO7z2CYfpMmqaqyp
	PLvwQnOIL34QDcIL5WZpWGNgTkGrLvxJZOQbV+0AQfAKVgt8nZ3VCd4WsXcmBy5eyQAfXwxPggp
	XjFWpsAvBQKcBa6SiBanC49ydRJdnzj+kBYE40vW6GS4V95LHWXj+nxLPxbMqIo=
X-Google-Smtp-Source: AGHT+IFzI7ofXoz6tqiamTePNQYiATxWPq14YAerOxCZ4uyzeaSK/NErrG3N1vsrCRC/MO9C5GFQdlL9RJQrRJeeA8s=
X-Received: by 2002:a05:6808:c2b4:b0:450:1e0f:58b5 with SMTP id
 5614622812f47-455ac837a12mr6166224b6e.7.1765870315162; Mon, 15 Dec 2025
 23:31:55 -0800 (PST)
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
References: <20251202174438.12658-1-hanguidong02@gmail.com>
In-Reply-To: <20251202174438.12658-1-hanguidong02@gmail.com>
Sender: 2045gemini@gmail.com
X-Google-Sender-Delegation: 2045gemini@gmail.com
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Tue, 16 Dec 2025 15:31:43 +0800
X-Google-Sender-Auth: XvPtkd-Gxef3gjczpCiP680NwtM
X-Gm-Features: AQt7F2rig2jn6EnuFacoVlXo38M5SBoWgs_YMwg_E1yYr_ObaXqwPpcO1npb5GQ
Message-ID: <CALbr=LZvZJn=Qoyfsr=m-_eCJYwRafmdXV+TAUQSib4H0j27rA@mail.gmail.com>
Subject: Re: [PATCH] bus: fsl-mc: fix use-after-free in driver_override_show()
To: ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ioana,

This is a gentle ping regarding the patch above.

I understand you are likely very busy, but I wanted to check if this
might have been missed.

For additional context, I have audited the kernel subsystems that
implement the driver_override attribute. Out of the 11 buses that use
this feature, 10 already hold the device lock during the show
operation to prevent the use-after-free race.

It appears that fsl-mc is currently the only remaining subsystem that
does not have this protection. It would be great to align it with the
rest of the kernel to close this gap.

Please let me know if there are any concerns or if any changes are needed.

Thanks,
Gui-Dong Han

