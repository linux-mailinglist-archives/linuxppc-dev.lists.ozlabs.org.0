Return-Path: <linuxppc-dev+bounces-17876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM8+NkRUrmlACQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 06:01:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC0233CCE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 06:01:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTlH431msz3c9M;
	Mon, 09 Mar 2026 16:01:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773032512;
	cv=none; b=oUa+69Dwm9ZJYe++uj39RbF7sKeVxrU9R9kwG+bgwkrJYhKRlsVyFbGsUZzu8evsoUCFbwENrwTp5+BPlWx/RuOuNlSis09+VOF78xFit3ruSMwoz+J/x/kyahfFh6Bhjpz7zH2lLeQc8zjfbHI+nylLw/Z+wzA5DsHWu84dEmbKQZO3MfxOo/bJx5bRCvl0f/OIb/DnLqvB91RV7Ls1pAsmhc//hD2kKIUU5ycftH/v6qoJdj97Khjl4kDhq4dSGC2y8VznVcZd0j3PspmNpO3Yfr8AG0AVFiyu9wz2OxanZWURi8zP/VvCAj+nXs5cxTU7kJ4nTRGNnDmFatI0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773032512; c=relaxed/relaxed;
	bh=nRgq5d41AXKZaxe7i8ISddthWw+N3IsXRv/a5kq0a+I=;
	h=Date:Message-Id:From:To:Cc:Subject; b=nLsMbPLXz8+/IXJkXy2nyfbKNiMuufzVyS07tNJ+cI3zyX2lo2yPGBXbUf/mkbFtJ4P8lzQIMHUGBDuPSw70nTcmkWFvel8oTyIyxlrlWcgRqHeCiKFoecKfRYphlgvdy1Q6xmO39k4qAlxro0YNQ6N/TugED/tsnXp+ety808MuzIBc1ePHb9AAmJzmY4AVhTG+CXpXiNtt9xk8BMIfCIzH6ozS6imYehJ7h2pjRTOPMdCtLf9OiSYyiVjkMPrp2NrJTQK9YHoGOfWnzDq8B8ggYOykrUFMrmAzY4ACfFMSPdy9PiuMhG6/yh4JBHhNtXHWK2wEeoM08MuKaZ43/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jKRcaoHj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jKRcaoHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTlH34BrPz2xdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 16:01:51 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a871daa98fso84063145ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Mar 2026 22:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773032510; x=1773637310; darn=lists.ozlabs.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRgq5d41AXKZaxe7i8ISddthWw+N3IsXRv/a5kq0a+I=;
        b=jKRcaoHjCf6ynRHTIiGx5N+Yo+VP2U0qUICDAxaiGjn3kvB+p/awrDTtyMfTYBgLP+
         7QaEt3UE+n3D3s3POVpkFl5sRhWY6HU2xuF6Jdn1SAHn0xnVPIeubl93EGy/9916XI60
         TzdwttdDga2XDURrQAVacS33uimgU0/ukXGCbBCo3ZViyfxx16bva9J3pIeRLmBkdGpg
         bjDvvW9+WHJyqhlCT9O8bhhIOn8UiaYAN2kWJlIGu0Cmx7QJhpufRaqTe0+QSuskzITj
         SnSI5j7aR0cxad6ItM+l6x8fcvxixxB197+t11kEYjaojY/bA5ed4nyTvoVctkiee9XS
         8d0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773032510; x=1773637310;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nRgq5d41AXKZaxe7i8ISddthWw+N3IsXRv/a5kq0a+I=;
        b=GX0UsiFUZRBCwiuTI76+7VMMcdBFSPuHzzIUSeBOVnalDbmMf3+eXCiX2FnpLOHrUW
         AdzBLL6DjU9LnkBXUTTxiH571ACqL5QPa/8AjunUtIvavLcdZaw0s0fTyZbSTzFeESby
         2hswuSn2tY0gVCILVxMzQoV0FjMVOOcG+1vmZphPr3TOlQD1JgQG00EAP0KHBggP4uN0
         sRSv4J/YRjyE4+A7b6HzRF6AB+43tLZ1Ymlver1EYJgHvqJ8TtkWB8C6RalYlMtaQ3Yf
         ADxy3GYPB2HLH915uxACkNvXCXi8msQs7aQwNnMdHA3oBpQuiIkNxeMMroYHH83+k9wm
         ChgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXLJLK158HeNuAxH0vFcFQZYIqJOHSMKnmvensHIH+EY+wPIreW/TCfxQ56KH0Fg8JTFi+4EI0Fxq5O84=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxW990hEXmKBlv3WRjvorbwSynMLuBeCldTxwZgO7SkWckN7I30
	LRceQzPZF700MJ1hZBaXXEVuI0QwEqyzb7BMdWEn6hUg2kshwXveqwxx
X-Gm-Gg: ATEYQzwYx8aRHk1EvSekkDMr7YuchlEUMO6DFW01FS3+zqw8qGpH1Q88bWrnNherwSg
	wMMLdluK4wLo4PKHxxWH70G+eplLtRkiRvVnPvpgEZJIqsUJ6spNZZeZhAW/D+CeZTSTjT1J7fU
	RrhOXZx9FaNUQLYwyyiyuSG9ZkZp4mUlgpXeIkAQ4De2+Knk2xEfkPtHt/f3S6gVe+OsYJuZ81V
	O8v3YR9sD0gWV2ZSuntzQcMfVgP14XSMXLuwwGjEalYreo3S8y4xvAEAfxHGuppkWf+3g90HY1e
	RShmtdrltcVnF8n0BFZAO6LGyQFs4J3olK1fV7p/cV5Rdh0saNQt0BQlKNctmCq9jgrF+MPx/Po
	aiMHsjIYzlA8y/8Dx0t3sSz6+hL/F+Xbeer0e1lrWLKoyIp3dBTOWxFKgNnVoluUAjO2IPNnPDP
	D+gV5KME3wQTEJLlO43rY3kA==
X-Received: by 2002:a17:902:ced0:b0:2ae:47c0:19ce with SMTP id d9443c01a7336-2ae824b5ba3mr110257115ad.55.1773032509983;
        Sun, 08 Mar 2026 22:01:49 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f74e7bsm98255935ad.46.2026.03.08.22.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:01:49 -0700 (PDT)
Date: Mon, 09 Mar 2026 10:31:44 +0530
Message-Id: <bjgxlhon.ritesh.list@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sayali Patil <sayalip@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com
Cc: aboorvad@linux.ibm.com, sshegde@linux.ibm.com, chleroy@kernel.org, riteshh@linux.ibm.com, hbathini@linux.ibm.com, ming.lei@redhat.com, csander@purestorage.com, czhong@redhat.com, venkat88@linux.ibm.com
Subject: Re: [PATCH v4 2/2] powerpc/selftests/copyloops: extend selftest to exercise __copy_tofrom_user_power7_vmx
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
X-Rspamd-Queue-Id: E5DC0233CCE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sayalip@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:aboorvad@linux.ibm.com,m:sshegde@linux.ibm.com,m:chleroy@kernel.org,m:riteshh@linux.ibm.com,m:hbathini@linux.ibm.com,m:ming.lei@redhat.com,m:csander@purestorage.com,m:czhong@redhat.com,m:venkat88@linux.ibm.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17876-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Sayali Patil <sayalip@linux.ibm.com> writes:

> The new PowerPC VMX fast path (__copy_tofrom_user_power7_vmx) is not
> exercised by existing copyloops selftests. This patch updates
> the selftest to exercise the VMX variant, ensuring the VMX copy path
> is validated.
>
> Changes include:
>   - COPY_LOOP=test___copy_tofrom_user_power7_vmx with -D VMX_TEST is used
>     in existing selftest build targets.
>   - Inclusion of ../utils.c to provide get_auxv_entry() for hardware
>     feature detection.
>   - At runtime, the test skips execution if Altivec is not available.
>   - Copy sizes above VMX_COPY_THRESHOLD are used to ensure the VMX
>     path is taken.
>
> This enables validation of the VMX fast path without affecting systems
> that do not support Altivec.
>
> Signed-off-by: Sayali Patil <sayalip@linux.ibm.com>
> ---
>

The changes looks good to me. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


