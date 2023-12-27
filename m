Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0210E81ECED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 08:25:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V7iIy+bz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0NTn5Rt4z3cNC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 18:25:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V7iIy+bz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0NS14B4qz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 18:24:15 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso1576872a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Dec 2023 23:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703661853; x=1704266653; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xDdXeKol6w1mu8yStaZ72YCGB66G18rESKjQfv82wWs=;
        b=V7iIy+bzWjU7i4dtVjA13rKmTJjiP4S/uVdOTiy5SOEBegjyXPLZUsdbjqTdj4QXYx
         cjqBiSAjdMiJ/4hxr1Mq8FzdnbBmb/Iq5CJEyd5Lnn1jcNdB78KVZMP+a4fOtgXspOAU
         wMfH0f4LvNACgRjCB41sYJLGOZJorokgcbv735FE0lgzxIB9ojNQA7Oxa2ribthFYVo4
         W7Xhn7OPxKYDw66M+DGmxQLng2h7VHDnHLjZTIHDtZq6xVIKgetyIijjqpkWBi4Vyukl
         YwZOeKXcRP8q7ALSJ1Ei+N3tmtWDawaJAVbvnT4tvDXeLip0TQUgsCjqdiD+gfxk5byM
         gZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703661853; x=1704266653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDdXeKol6w1mu8yStaZ72YCGB66G18rESKjQfv82wWs=;
        b=idj55r24E1FZ+YmzO13UwKPZj39TNAWDOxhb2oHXW7Or/1xACEkDAW05CFrKykaUl9
         zHNLrS3i7T6G3RaOF4BuDYqmOEYumb1crgXoNVyXeJc+C9VIuRUzI1DTWLaFmcUOyug8
         SYjYxcG0OSAOHoxo32ldRKd9CFqkz0rfnJZc/Z3DK6gUzPwHD2pkWrfjsfKCw/lMmQAM
         OcN0P0WwwAUcFyPVha2hCXYHX2CAYs2L2OaHuTk4WSilb16jArrnK4SdO+t1WouDLCx4
         kTP6hT6Xk0DJFPmyNMq6dkmQ7mHYhUzADb+fcUP9nHj/o+pJ3K8wNYePN5Xd6oc3ahWm
         EJ0w==
X-Gm-Message-State: AOJu0YzlBPDYgqytXQdRCFVJuHOmzXW1T6Pc0ZdyKnvlPInoyKguNict
	kwO3qEK/fzN8sJTiW1DD96xKzXmFDgc=
X-Google-Smtp-Source: AGHT+IGJkyxSXd1Fi184Nh3l5WQsKEBkduzqnPZopJveVE6ukfyb4pZ+kMLcO3jTiFKvw1mGLuBNBA==
X-Received: by 2002:a05:6a20:88aa:b0:193:f809:ecd7 with SMTP id d42-20020a056a2088aa00b00193f809ecd7mr2792417pzf.14.1703661852636;
        Tue, 26 Dec 2023 23:24:12 -0800 (PST)
Received: from wheely.local0.net ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id px9-20020a17090b270900b0028c952fd855sm261074pjb.52.2023.12.26.23.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 23:24:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] powerpc/ps3: Fixes for lv1 hcall assembly
Date: Wed, 27 Dec 2023 17:24:02 +1000
Message-ID: <20231227072405.63751-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
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
Cc: Geoff Levand <geoff@infradead.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This (hopefully) fixes the ELFv2 bug that Geoff reported, with patch
1. And a couple of other possible improvements I noticed.

I don't have a PS3 setup[*] so I have only compile tested these, I'm
sorry.

[*] Is RPCS3 usable for this kind of thing?

Thanks,
Nick

Nicholas Piggin (3):
  powerpc/ps3: Fix lv1 hcall assembly for ELFv2 calling convention
  powerpc/ps3: lv1 hcall code use symbolic constant for LR save offset
  powerpc/ps3: Make real stack frames for LV1 hcalls

 arch/powerpc/include/asm/ppc_asm.h  |   6 +-
 arch/powerpc/platforms/ps3/hvcall.S | 298 ++++++++++++++++------------
 2 files changed, 171 insertions(+), 133 deletions(-)

-- 
2.42.0

