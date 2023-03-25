Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E226C8E78
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 14:25:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkKZh16Z0z3fTH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 00:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PBXJADoT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PBXJADoT;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkKYp3kldz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 00:24:44 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id u10so4254281plz.7
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679750682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HPOE3n7g+VRSUTepYf8hQJ9bRIn+5N1az+8qZhGJc/w=;
        b=PBXJADoTPvrHW3+YEKIeHwZAzq0hEZplfLNGuJoVNB5w4JxwAdiSK7ww3gcldUgu5J
         QL3N8Fgu/Ip9gko6lNxeyDjxi4tA4JlzRdaRxl+wpY5mQ8i0IYq6RoEMsnRzIIb0kE4C
         K87uZvyd2ZZ8QGcDE4kVOiEBHhOIJZqjwa4Ucx1u583L3KZEoxpG8M8gFhN96582MQqV
         X7cbtNTPRQ0AODs2b9DYXaBFS4ItSAEBfMMhq962us4ZpHCsZXBsxFD418j2fFe7G0Eo
         h6ams94itWAxxQ5FaFa/pnWq7+TJY82aOp0I6bew3D9dsgsDjMDq/qjc6x2Pkt2w8kbg
         mAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPOE3n7g+VRSUTepYf8hQJ9bRIn+5N1az+8qZhGJc/w=;
        b=d+PDmfF8LVEDtpKTx+nI/n2QsNt6Whl9S8M2LN+IGBmrgHAzNBVkWUHLGtNqgUHTFZ
         4Fww5UiL8p106LXlFwarENM071EO+9RzHx46eK+41Foq/W8HRalcTmbzMeS5oX2JC5bM
         dTeMoQdch6dyqHCYSZrcHjcQ20GgW3aT0yFKWi89oKDATNNOIOnbuKsB29sjRYHImNIm
         2Mw4NMntAcNJtPvUiDCIC3OotNPkSN8uKBaa3UlVE1IXkg1joymsUgaVdz4ym8RY1Uxj
         1K6DUSetE3xWXcox+EElbKPAkfDQOHeFuMDqaC08eW2nSvawVct+gCk8+lBAcEEzr+OJ
         7DXA==
X-Gm-Message-State: AAQBX9eK9TUcie4r5khhu3VeZt8+ZdYw12lFXOnobEFszjsnMm6Yl7D5
	hAzaOoewQe3rdXel+Jdf4YVJRO3mOno=
X-Google-Smtp-Source: AKy350bjpRSWQrd6tVJ9xsldbxq6WLGYPjQe9+dMKrXwokOoQKzSWA2LvtfJItyOgPx7VvjiDUex7g==
X-Received: by 2002:a17:903:124f:b0:1a2:37fc:b5f5 with SMTP id u15-20020a170903124f00b001a237fcb5f5mr589595plh.55.1679750682301;
        Sat, 25 Mar 2023 06:24:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id k2-20020a170902e90200b0019c919bccf8sm16001552pld.86.2023.03.25.06.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:24:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/2] powerpc/64: More PCREL preparation
Date: Sat, 25 Mar 2023 23:24:33 +1000
Message-Id: <20230325132435.2459170-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here's a couple more PCREL prerequisites I'll see if there is
any appetite to merge. These are mucking around with very early
boot which is always scary. I've definitely not tested it on
enough platform either...

After this though, PCREL enablement only requires trivial
changes to boot asm code so these would be a big step toward
that.

Thanks,
Nick

Nicholas Piggin (2):
  powerpc/64: Move initial base and TOC pointer calculation
  powerpc/64s: Run at the kernel virtual address earlier in boot

 arch/powerpc/kernel/head_64.S | 106 +++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 45 deletions(-)

-- 
2.37.2

