Return-Path: <linuxppc-dev+bounces-14540-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159AAC916D6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Nov 2025 10:24:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHntY5phtz2yvD;
	Fri, 28 Nov 2025 20:24:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764321861;
	cv=none; b=aOYMY1Jf6p+0FFEF4qKRsJegjO6/ckdH3U0hngvDoGhgqTbjMdQJMxSTP239McQjfX6MjW3RTQfjmRQFMuWqIF5Tog1mGOWGlnWmVhxlULGf+3ZIrdIJLmeTopRs4lWsjaQWljrRgpREs1sivGuPf/STVZkxRE4Kq5yLssCQnNVJvRM32hhyvZ43v7K6RExEjsOsXJMPZAZseYPD2lxesNOSzBt9fdty0n/DYfm+jHKFum6ALKcDesgO8V+SQlR7EseOfkOaFs7g8yTAON/KU+sjkFlb88IpdFX6nNR8XV00kMB+Jvgp2edf7ht0oPZkcdIxmQv02K94GPlc/fYnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764321861; c=relaxed/relaxed;
	bh=ED9nuiaO8n6F6aMYH2jutdJWyKTjRdS1+Fiwm5emSdo=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=JVPNz1TgHAu4fmCStjKq6jVoWkn88T8ohdPU4DpY5Q6Tzn/OSDTZ1y5AwjCoSjSzlkQDELS98VpETND6cWwjzvm7+APmrvLDVnwruVm6Xi4WABNBIzXtzKyEgCy3v1VIR9DAwi/Wb2f4mLFVcPj3Y6sa5Bd/FhG1Vk0Ukh6/s1OA3Uo0V5u17F6iHjv7jvB+w6aQvnuCnJbyld7+FMrHUZJlHb/MFkYNySdW8vcN2WL/Vn0/8oqJV4FBfegBEOy+tdztt4PZDO0eT+TtHahaUv7yaSKgXaQPmXUooypdKe+qm+ms91xowyxoFU1c33fmLBlw55GojvuriH2lYqiDbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZWJXIJbL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZWJXIJbL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHntX196sz2yG5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 20:24:19 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2958db8ae4fso16844315ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 01:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764321856; x=1764926656; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ED9nuiaO8n6F6aMYH2jutdJWyKTjRdS1+Fiwm5emSdo=;
        b=ZWJXIJbLPMz3otMLjPSAyi9QIKlITVpYQKz1wsPIm1h/QmQ8OoWBSrQgP2OQVoF2p2
         snFQ+xpmTtBcI5T+TU2P7Kpv7xJOSjmPXMQryxhb2XDBcEaziDx2UT4Hbbr1awaTJehb
         szoPu/v7ENujvbYysIq6ipAs0GFuc6U4rSwxBMJ3I2J8BeWPGyxE+lhnBYwNt2lSh1cE
         bGIsRwksCs5b+QMulYEN+XWO1WH6Of/+92SKI8SJXLQflM9ubG0/DbgYAB3LjY7pZTTQ
         aLTMWkXEcq8p764CJsPQ79Xu8Goo2+mXMTGMBSypZqaYY5iI3mk0OtPMDgX67TNgXNHV
         MG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764321856; x=1764926656;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ED9nuiaO8n6F6aMYH2jutdJWyKTjRdS1+Fiwm5emSdo=;
        b=GQJCvtAmPSJ5qLThtsmlvjf2UYWayzLE/tpPQrkibzKI/Abm8VcT5v5c6pY1860qDq
         625cAmLxEdOerowEpc0FEGMp7tLmpx4Sii3WragVzHEobKWnLj3RSgh7MIIoq7bknxzx
         DFdQzYs+c1BcdgucbYPo4kLBjB2Z/s4LN+mx857xpcGQIe14DpLMrQrJJQcZqDm6U181
         QyJDIG7WS8ocqt7DWewjKmRurp1p6VN8wgS6Y4g7me9iscZckJ4+poKnDvmfcMJTxDfo
         v5gcjcXCN1U5tNhDxsB74dvkEQnsX7DGz8DEMy2bheFTmcsW4H+TYHPMRX0r+ERahJOE
         fS9A==
X-Forwarded-Encrypted: i=1; AJvYcCW2MA9dG08p/drmeIIU/3BSp3asNeJQKTjCE3tul+P5GN+BJpdsPkvg6JVb/pXq1Ot3TS0lXVDtjdStuQk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywq6mXvg+r7WCEy8lrn957NQj+dUBxWbRyd/zndiYPNcP7GV5zT
	wb+uInhpjPEE/MJtkO63oOVjPJO7kV5YfgjoKoriZSn0mZYVE36qRGLv
X-Gm-Gg: ASbGncspvss9gNG0T+SQ+Qqm9AVrGXzktP2iLVP0+sgfWtMTROxp1RyoW+72xLFCNkl
	8XbNuwZNMwsiubNVhZ79YJ2yUzrCKF3hhEXpvbDX+tCljukv7gL+vf6I2iuDgt6e7SeOOYw1NpS
	gXnsfuYGlEtM54D9yK3QOHp5PAOxYp+lsBZJ7iiNPZb6ozMVIrM/TDkXz5mikhMyYhEKHLbiqJ2
	rQGBANGzYMfLixZgoKCk2EkzdydNtG9Y137PUdZBoxzlRAWxq8vgNsMUkhWyMkLrbyOqho40Cl1
	T1MoNxvjZuMKRbY0MHM97Z093gnGHeYCOItXiBSFJn42a1hERXJIlC/MISFtQaLVC0ifvl3VcJS
	JZKtFa/ldQt2L3gX2S9yYpImHJyEQTpUFiEiEiBCEDAtoTP63cu3hOQoST/EXi8oaOfQLbGA0jX
	b6w0BaOYT3AefrrL+l
X-Google-Smtp-Source: AGHT+IFkvqq+4XxuQKa/k2q+LQMu+sa6LTsS3nR8WXj3JiP/G1PdBLLzpGBMoYNmd/LwjyGU4dN/Ig==
X-Received: by 2002:a17:902:e54c:b0:24c:7b94:2f53 with SMTP id d9443c01a7336-29b6c3c2913mr349029165ad.6.1764321856487;
        Fri, 28 Nov 2025 01:24:16 -0800 (PST)
Received: from dw-tp ([49.207.234.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce478762sm39554625ad.45.2025.11.28.01.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 01:24:15 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, David Hildenbrand <david@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, stable@vger.kernel.org
Subject: Re: [PATCH v1 1/2] powerpc/pseries/cmm: call balloon_devinfo_init() also without CONFIG_BALLOON_COMPACTION
In-Reply-To: <20251021100606.148294-2-david@redhat.com>
Date: Fri, 28 Nov 2025 14:37:28 +0530
Message-ID: <87wm3amsof.ritesh.list@gmail.com>
References: <20251021100606.148294-1-david@redhat.com> <20251021100606.148294-2-david@redhat.com>
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

David Hildenbrand <david@redhat.com> writes:

> We always have to initialize the balloon_dev_info, even when compaction
> is not configured in: otherwise the containing list and the lock are
> left uninitialized.
>

Agreed cmm uses balloon_dev_info infrastructure beyond just
CONFIG_BALLOON_COMPACTION, so it should be initialized by default.

The patch looks good to me. Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

