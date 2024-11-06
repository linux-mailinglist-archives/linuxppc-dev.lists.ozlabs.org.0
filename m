Return-Path: <linuxppc-dev+bounces-2900-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAFC9BE0FD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 09:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjz252pB1z2ysW;
	Wed,  6 Nov 2024 19:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730881885;
	cv=none; b=gOWkBxr6OQk/hMpeYa+OeXON7IZQqiatMUjghR67/zoDZSBSdi1R8Frl3yQlBcGri3jUug2jMKc/c5hNAmrdGzEeVz9JWPY6Fw7LFSAxn8shGmSvkd8iA7yNsMto7OfjInt6z8Fm2Dj9CUwLqmNwB2TZmVuPkLPjh0sew1ZZBu1oPvMI4YA/urcJ/eTUjIkHysPiTpdeiNzhCUHze7PqtOKFtQDHi5tHF/9ichrrCalpKbOCFVU0SRXY2BpiTm8AispQcMWndBTbuqgFpgIvTeqMzNjZb/mv8ayNoedEgOpat0Rxn+CVzbpE7c9ngQI5lduMDgnvtODRfSrWl0Lk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730881885; c=relaxed/relaxed;
	bh=07GbT0nJXb0bg2S4cC6VFbXNSfpnDqq5VVWo9wzHJUQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ITQVZwMLt3Jy1fR6lXoqutvoZ7A1RTJdDWLexQ+XenPIrWmvoONNZDrfScKbAgp0sbjKMebuQhww1PZUNhVD+ezLvIGDt6En1e/M9MQ4lE3pHm7uZXMe1pPCQFF1C2vN4dzV5Uz7tmdUAc4K96JqD2DXtbYBl7qyDpgF9mAw9TcuLU3BMACuMvxbgUzCcmKm5NriYupiWuhEKKSVn/mMSNbM9pvm+85BP/33z97XyF2oB8Hg79g2OlvfstibiCxZblNVl0lViMMLg8PHVdVLdm/4r+4m8QORbZa3GsS79O5A8iUlAdMsr5t9qbDGcuWjcWQfrwF36bjXux1Lh8UN7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KndC0AoI; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KndC0AoI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=bugzilla-daemon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjz235tT2z2yn4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 19:31:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1790A42AE7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 08:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86908C4CED0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 08:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730881875;
	bh=73K04GfKTCuYWbpj3Z5R9AMeNg6hKEEWrF3XJllpN8g=;
	h=From:To:Subject:Date:From;
	b=KndC0AoIIt6Vbti1zJhVDT5GPx42Vh40a/+zgSbygxAgjj0vqwLH/OUOPbLxMr4jk
	 9XHPHmsGyC1Akqc2JB39wxKjhRUrMqBdMW+TjV1+ax8XpqlDm92eo4Ufea6PIo5tn0
	 UOsFiuZGPMdUUr/cj/TTMeQtvpobN1WrVXcEmHMyVPNey56nYjFlR0JxQigAOTdPwV
	 srW2be5ka/YIDU+pIajM1bmFlrtYKi6ogJRL54JN6EKPIL4Df8cX18mmR/6cTr7h3a
	 fUQUN1PMl+HMIo2W6VDe8Ba1G1EO0r96PD7fgz/Ou5fJCELmfJNqg2+AwjmZFbGAbE
	 gsznIrndSdi+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 72778C53BC2; Wed,  6 Nov 2024 08:31:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 219472] New: float point load and store
Date: Wed, 06 Nov 2024 08:31:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ccxuy@126.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219472-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
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
MIME-Version: 1.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D219472

            Bug ID: 219472
           Summary: float point load and store
           Product: Platform Specific/Hardware
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: PPC-64
          Assignee: platform_ppc-64@kernel-bugs.osdl.org
          Reporter: ccxuy@126.com
        Regression: No

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

