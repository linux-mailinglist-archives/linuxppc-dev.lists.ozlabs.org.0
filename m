Return-Path: <linuxppc-dev+bounces-17084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIkBIh8FnWk7MgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17084-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 02:55:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99871180C36
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 02:55:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKgmC5mvYz3cCh;
	Tue, 24 Feb 2026 12:55:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771898139;
	cv=none; b=L9HSKYKd7OajpIFxeF2ExyPnlWMO7g5xE3STtj59zGaPHSVXIQShqANZEigkdY6pZvbV2dxKZU4p/1b/lPHBROQEduaocASVN/nqjGgItvq2QCp019S+/5vGjpQmehS95+qRDF2pQSxpBRKrGI9q8iODsFbAk8+Wj75g60y5RjEMqF0qJh6G6wdoelPowkgKvp9ZMhEPKS6mH3MoYlS+RhIO4uxiGjJCYb7Ccy0WZzyLm8IVXGwRIgErWyq6+1a1l7o2hrGtbZFh5By2MvHYfaKmQZXs+pRlcualJTfY0sObsq64MmiZEUI7/D+xgoEPCLW9gN3IaL5cSqz7eKvNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771898139; c=relaxed/relaxed;
	bh=F/kkp9/hv/NUeBmN5Ot4cYQ7fdbIXd84ugK0aulpqaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0KqktmoNhLh6GuZAoCbwjOQtoFIG4wNZ6dqydNpuuDpq1bQRtEssfT1Srlk0iiPdCcqkZuZzbrqNKrKxZ2pvTU6yH7J1eJds6m5xvoJlqUcVDzkftKmMX1yTQlazImP7zSOb/pSquxRA7GRxWbjzpZ7hUmF6XmDAnTqGfaga8NohCSr94DN933mpBk5ro04E1OKsHcjW3jpXXKshZxmAZUKKYDhddqmM1eLOLkUCNYjRbHpzk2O3P2tqRz1HNOtF/WOZBnElV/95LR7XM1Hd8NS0JFKcXpo0d/mze062w6hKRxD2u3GMN/MVU9vUuZTF0HOIDImYfsUr17p1YrFfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KZNyyi9m; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KZNyyi9m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKgmB4QJbz3cC9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 12:55:37 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-824a829f9bbso2592135b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 17:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771898136; x=1772502936; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F/kkp9/hv/NUeBmN5Ot4cYQ7fdbIXd84ugK0aulpqaQ=;
        b=KZNyyi9mNWdCzJ/kB/OlC3D7vqqRQX6gLLmw7mkuKgSU6GRQ+/fYMzQeodV73xQLHl
         7RHDplUYLrzuYCAetr6LqvO6Ac+mf7K/M+3XoPLj67wBd42Ktx94tiCS0itEnbCXnt9M
         2pW9MP4uElyz4kp44envE8lOJ++Os++K58rGUFGZGKfoJxO5SVSXoEv+IIEDuEJHjEia
         o8mXI9G3VngpOYJMpvbbjvfehZQqkjnexIb+d3rphiUOCgETsRD4+4+rMH+X7CBw2YO3
         eP6DQw2KLJHgv/9EGIAcodc72Hq5FW8fpuitqirIG46MDvcVnpLSDgG6RokNauLdCTRx
         9eVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771898136; x=1772502936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/kkp9/hv/NUeBmN5Ot4cYQ7fdbIXd84ugK0aulpqaQ=;
        b=j83iRBcYUMUPmHJE0msmaTthwUqffHnOfmABd3i3dYUxhbrYl3zfOVM1bRg0l6Vx1R
         4cdVh5qt4lnUBQL7JedyvEtBmwMh6jV0qat6OTES2T9kguwYJH9kb0NuluNPIvRTp+CL
         IheRcXMs25srnDD8/fNeMknfXvQkIvkRHyxCSFz43L+6n/oEHnDOqYWi9nTrFnvoicCn
         mf580XgQyp3NGOQgXQ9TflJamEttzslQt8n2Dlhlq5nhr8egNPUc53UQbzIbW+fkWQpl
         zZhAMl0zo/m+nnJ011pN/50l0uwp7EUAOTlT1JiZFjxrPe5Q3KrkCzaYTvI7bzrlLaNE
         ARTw==
X-Forwarded-Encrypted: i=1; AJvYcCU4S+q4PaxgTSCx+W+tA0nuHn2p1KI1o6ONtOt448Afhdvuu2hTq2y2d6bjQCSYdaK8Kf+eXIiYvoN7XiA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw678tl3eW5SykyGgLUxDSlFj4XnC4q53X2nnN3BjRnaP/Pnl96
	QDm9uok2suF4k7zTxnELo7yH+Oq0lfVJKCvSm3CpHVz+o/RjmYbo06Ya
X-Gm-Gg: AZuq6aLpgGRK7o0/7JlhWGsF5E8lA8NYvw3SAGHzgaeLNqBA10g91lvdfVbA9BaPtIx
	/hwFnmSW9UeJGrkrQNCwmUiD1c+MXFlc8TtoxU5haT70LgOH0vnFoxFYg3UlP/JxlPpR5Oc3CpQ
	U2nXIgElKsa8cNqSNH4ZUBq41eU6jcCmU57O1BgAhFuOhnMpn5f9hZoc5rA8xlexg0djkv7HDXR
	YE8K/K7sCk+76ocZmjVgO9HF+5QpktOsIh6r1SqlQckqk6Si7htXPBB7j8qLA00RXWTfjWTp3LY
	nrAdO2nSuGnxxDX3PUTgS7yJvbYhd7aQsfwKZaeHelTwUPhcJJ6aBobKZWHwbme4pJg+GjX6GAi
	diRkkoIIO6LNdfAD3qWgW7OSrIgjiwN+0IAHfEOlyZvdKQ7SLbana/bS96uOifd2RSKEkXmyBrO
	as0oAGk/hcilwoNuNt3z5dkGqG3KmfAcJ6IJqWuwKq1OtqwlLOewWUZQ==
X-Received: by 2002:a05:6a21:b8f:b0:36a:d3c9:efa5 with SMTP id adf61e73a8af0-39545f887c1mr9078001637.52.1771898135815;
        Mon, 23 Feb 2026 17:55:35 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b726ac30sm9278832a12.32.2026.02.23.17.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 17:55:35 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk> (maintainer:SFF/SFP/SFP+ MODULE SUPPORT:Keyword:phylink\.h|struct\s+phylink|\.phylink|>,
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC FS_ENET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net] net: fs_enet: add missing kfree in _remove
Date: Mon, 23 Feb 2026 17:55:17 -0800
Message-ID: <20260224015517.354145-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
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
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17084-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:pantelis.antoniou@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@armlinux.org.uk,m:pantelisantoniou@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rosenp@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,armlinux.org.uk];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 99871180C36
X-Rspamd-Action: no action

The kfree is present in _probe on failure but not in remove.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index d3c772ed5fc9..ee2b7e8866ee 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -1008,6 +1008,7 @@ static void fs_enet_remove(struct platform_device *ofdev)
 	dev_set_drvdata(fep->dev, NULL);
 	phylink_destroy(fep->phylink);
 	free_netdev(ndev);
+	kfree(fep);
 }

 static const struct of_device_id fs_enet_match[] = {
--
2.53.0


