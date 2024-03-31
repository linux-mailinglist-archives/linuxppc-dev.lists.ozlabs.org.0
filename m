Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC889337C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Mar 2024 18:42:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A0jbTc0m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V70L63DBLz3vnN
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Apr 2024 03:42:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A0jbTc0m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=62.96.220.36; helo=a.mx.secunet.com; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V70K80qLzz3vnG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Apr 2024 03:41:32 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 9F0BA208C3;
	Sun, 31 Mar 2024 18:41:29 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwA_0M8sloYm; Sun, 31 Mar 2024 18:41:29 +0200 (CEST)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id 2AEA9208B2;
	Sun, 31 Mar 2024 18:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com 2AEA9208B2
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout1.secunet.com (Postfix) with ESMTP id 1DF7380005E;
	Sun, 31 Mar 2024 18:41:29 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:41:28 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:37:13 +0000
X-sender: <linux-usb+bounces-8675-peter.schumann=secunet.com@vger.kernel.org>
X-Receiver: <peter.schumann@secunet.com> ORCPT=rfc822;peter.schumann@secunet.com
X-CreatedBy: MSExchange15
X-HeloDomain: mbx-dresden-01.secunet.de
X-ExtendedProps: BQBjAAoAwHYFfe5Q3AgFADcAAgAADwA8AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50Lk9yZ2FuaXphdGlvblNjb3BlEQAAAAAAAAAAAAAAAAAAAAAADwA/AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5EaXJlY3RvcnlEYXRhLk1haWxEZWxpdmVyeVByaW9yaXR5DwADAAAATG93
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 10.53.40.199
X-EndOfInjectedXHeaders: 7419
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=147.75.199.223; helo=ny.mirrors.kernel.org; envelope-from=linux-usb+bounces-8675-peter.schumann=secunet.com@vger.kernel.org; receiver=peter.schumann@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com BBE7A207D8
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0jbTc0m"
X-Original-To: linux-usb@vger.kernel.org
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711876669; cv=none; b=HNHfJ04sFe1VZxBK7x42KbxDz7L7YFbKW0/RQY/n6EF7R02Dv0yWJnQv/W8S5yTlQNXYLD26gP9SX0r6mHtv0cKBO28EIxyU5zZHjllpzFHVM6SmNkBh/U17jNXqYt5OZ/z4DT5E1785S7Q0CbS/C3Zh7r9UdZoq7A6JWXvf/AQ=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711876669; c=relaxed/simple;
	bh=b5bp6YpDxDNAhHm2eA09MHiyRDWjIhYQ/8XegN7bvrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Krgi7KnHp3PRxSsstLx8wzUDwwVsSZ95p1900DqQoOJXvIa3uPndrbwLm/mX8mizlCWxXdIPYD7Lx/oYyACUO7gL0u6OcCwxTYuJGfR/L14iXgZSFcAWgmk9Qfg8cGjlBSMbJMoHG83qaL2CqC6bVTi2OO5ovRl6TrKeNnlHOZg=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0jbTc0m; arc=none smtp.client-ip=10.30.226.201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711876669;
	bh=b5bp6YpDxDNAhHm2eA09MHiyRDWjIhYQ/8XegN7bvrU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0jbTc0mAulFmBNoTtt//EDp/0g+p4YpKduEYSB4vomzDvZQbvdeBeJViLQZS+E4P
	 tuv2na/t+5gpAGnMUfgkpnyU8jW1slfli7lSIVFIHZvfNRUo/ejGaLAw3tZQeC7UJ8
	 j/C6WdlKYNf2NntBp1VrB0akoqpsn3h7Sx4IQZzqAp6S+j5ow5fulOs90Wx7pa5ZQv
	 E8IadavguuF70IR6otgk4V5nEHI/5DHiM9ztMaJwNp8Ug7DIm5DotQjZzNWhnKUimb
	 2idSeatseygg1Kw4Q4JTKSF3d/xe3D3WJv6fwB8okT3Py5RRLl3T9zEt38O1zCSOmz
	 VnsAIR0ZlbX8g==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ran Wang <ran.wang_1@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] usb: typec: nvidia: drop driver owner assignment
Date: Sun, 31 Mar 2024 11:17:36 +0200
Message-ID: <20240331091737.19836-2-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331091737.19836-1-krzk@kernel.org>
References: <20240331091737.19836-1-krzk@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Core in typec_altmode_register_driver() already sets the .owner, so
driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes in v2:
1. None
---
 drivers/usb/typec/altmodes/nvidia.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altmodes/nvidia.c
index c36769736405..fe70b36f078f 100644
--- a/drivers/usb/typec/altmodes/nvidia.c
+++ b/drivers/usb/typec/altmodes/nvidia.c
@@ -35,7 +35,6 @@ static struct typec_altmode_driver nvidia_altmode_driver = {
 	.remove = nvidia_altmode_remove,
 	.driver = {
 		.name = "typec_nvidia",
-		.owner = THIS_MODULE,
 	},
 };
 module_typec_altmode_driver(nvidia_altmode_driver);
-- 
2.34.1


