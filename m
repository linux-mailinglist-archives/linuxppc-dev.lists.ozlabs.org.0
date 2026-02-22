Return-Path: <linuxppc-dev+bounces-17003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /zTqAaGimmlxegMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 07:30:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A8E16E8E1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 07:30:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJYyg4nlHz3bll;
	Sun, 22 Feb 2026 17:30:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771738890;
	cv=none; b=e/3iqcKjVRIAWHq7nsfHkMLqYRgbJ4G0OqS8MIhh1Y1MbZj7XEEyfRqPCCiq9rV7NFy++nOI8ROgYlCqfRfyoeOhQpzRP+TVvqyAs76iDgVjZGTEsfExOeeacPSGTiyJtktz+kymB3IPGO9ioxBiXzBnJ60+UxI7yU9xwRlivnDOT4/As3nQNzasuoSo79MJQp4lB/x14TbMwJHJ7Yw7cMyof0ocjyjU2G2Q5cpIjmgQo75hiNZ1RbpAm1JFpTnwNd7xfhIgl/X3NuSlO1uqTyZnC3ZP9b1/S12IOcwEoBok1i7wmzHJSPomT8+iUDmV2Htg81jtO3BAKqd+W/0lsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771738890; c=relaxed/relaxed;
	bh=p3Z/yBJ2hZx3EcKfd+7Xe19sF+zpgD7i7OaZHR1+Q6w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tou3K+1kX9QVcrXgbn2mQOOfKiSG8w6fLjLKwMbfl6kCzW/aHXb4zLhjRn3zTTDPSDA7bU3afov2BVthLEuKI3Rez1RD0kUJZ7REJiOq3Wj4RoYTZwR5LrM0Wx76UO4BWPaRceH84t7R3P61TSyXi0PMQ0dyud1AeSJldSbMs44rTdWjWOVTN9QOiBoxtgqGbT6327atKzC29GKIT++msUDgEQ+D403Zqutv+fMWHxTEnowUTRoLnTKWAv/H6LaLl4uztEnmu9B8P9nRlWPWb0U+7HJkH0X3vp3gZyynwmDbsniHiUgo6sVlEjiGXPy3HqpuFh3JsSt+WSyWYVz9Cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mqzKG9Jb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=abhindeka@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mqzKG9Jb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=abhindeka@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJXsj5lLsz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 16:41:28 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1740610a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Feb 2026 21:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771738887; x=1772343687; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3Z/yBJ2hZx3EcKfd+7Xe19sF+zpgD7i7OaZHR1+Q6w=;
        b=mqzKG9Jbps6hus6+PPf08xb3zFtdgn5WtqypUoadW0KarXfYZxuVm8QX5bA00LeNqX
         8Tvuf6a78RUQOwlj/s/U9TZj105Z+Kj1sr8kac6EBXKI5mil0QWLTFTWJbgXpUn8p77o
         u9FKZpPF+C+avyT5LxZeyfc6Qy6XWsSI+7lcm1Z17PhKnE5F+7ly+BM1XYWfTEsXqpel
         sbpsc8RgnR+YEBTfwcIPqnOF9a5QmSKUur2T2MoIe2pmHHdvrTqSNx0yQggCIx/UvM1i
         2Q1acM1ZyyBEvzwb+lKFlHZD6olDDQEkiK0sIbt5xbGuzfUqXKDVvAb3qjVu0hNCR7+c
         uoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771738887; x=1772343687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3Z/yBJ2hZx3EcKfd+7Xe19sF+zpgD7i7OaZHR1+Q6w=;
        b=S8G9N/OX+z/R95Q2zo4N0nxkeQ3D0KUOwMfwsJ30UHYwM27DJEDF755WTVy4KfF/O2
         KraoaVa8hpEWi2SnxrrM2n7hvjKKWdcNxlfAtGgfwJQ6hdWGOBMttxulj//bgtgc3Yk6
         I+2yewtwiCgMR4iL6aLdkSU5Rw59FCl2Q6rvjq9bEVG3bp6wgzDlb0AKNvkEzM5etKuy
         zrS38I3U6oxFFPqaciw4mKJrJ76y36mPhhLDOj665LMDLFW+Ay+peNEVF5y0l0+kSRV2
         KAZWxIFTJgM9APT7nx1nYSVz0PGf9QkrE3Eb7UatndW2w9gEMEcqTD96hXY0KU6lhgod
         iAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUy1ld0aE2rrltLUifMiDPgR5DCFQhNoyyCrrMnPchJTF6n3GYgXe6AExe6JcwSSF5OnaRdwV2qHUB/mA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyo+UjEn/t4XUbweGDnI3JROnJkc8dfB6X+2Y4ze0UT0dQxpBNV
	A1f3RSF0JsZdYPAlge+O1T+RmRDjE9kk77KiS1WoT++M4N+6JQ2CFV7g
X-Gm-Gg: AZuq6aIEMOqWs2yNSzvYdfVHurLKIrB0iolJpWIEStPMyM7ZCTU7wecBxL7NyVU24SN
	R/EfNvNWehlAzk1a9qutHvhB2arKNvNbYvxON/2hM4RVUOgLde4jMGCdAmx1gE/XnGve9UYvUQr
	zazbGzjYIjk/FsG9TUWYYMaD/np8KzPEeH+A+5GI5I1vdXKj5ZGfy8GX/0t+GlNKwnyy2/k6uJ+
	sY4AetjcbaAR2YYi+aIaY90yP6XPPiJtrvrKLDxMVkcHhwObQLXoQGG2pUUdeqRoNZ2BEC2+evl
	QjdrvABPhDYQ178/idDEQfn+FbhBuyFxiyFpOFiD1u26o7XbF3EsBIWz/2bniVjqhLCk2EMC4Ag
	XHSlqlx77BY+UB+ne/V0+tyd786j3TMURkX2xghDLjmCiZqZcZpj2Pc9xKs8pgXX7MRBV+Ja/vA
	6x1zg+VDJg3hr1jG4RkyABebF9fv5oMVaIendpYg4QIUMvObYf4ibjad0i
X-Received: by 2002:a17:90b:5646:b0:354:7be4:a241 with SMTP id 98e67ed59e1d1-358ae81e3d4mr3566849a91.15.1771738886764;
        Sat, 21 Feb 2026 21:41:26 -0800 (PST)
Received: from Ubuntu-Kernel-2204.local.tld ([49.207.50.26])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d81cdbfsm9728510a91.7.2026.02.21.21.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 21:41:26 -0800 (PST)
From: Abhilekh Deka <abhindeka@gmail.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	nnac123@linux.ibm.com
Cc: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhilekh Deka <abhindeka@gmail.com>
Subject: [PATCH] net/ibmveth: fix typo in ibmveth_remove_buffer_from_pool()
Date: Sun, 22 Feb 2026 11:11:17 +0530
Message-Id: <20260222054117.14943-1-abhindeka@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-17003-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,lists.ozlabs.org,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[abhindeka@gmail.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:nnac123@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abhindeka@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[abhindeka@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 09A8E16E8E1
X-Rspamd-Action: no action

Correct a typo in ibmveth_remove_buffer_from_pool()
where gro_receive is misspelled in a comment.

Signed-off-by: Abhilekh Deka <abhindeka@gmail.com>
---
 drivers/net/ethernet/ibm/ibmveth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 3108bf50576f..3272134611c2 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -480,7 +480,7 @@ static int ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
 	 */
 	if (!reuse) {
 		/* remove the skb pointer to mark free. actual freeing is done
-		 * by upper level networking after gro_recieve
+		 * by upper level networking after gro_receive
 		 */
 		adapter->rx_buff_pool[pool].skbuff[index] = NULL;
 
-- 
2.34.1


