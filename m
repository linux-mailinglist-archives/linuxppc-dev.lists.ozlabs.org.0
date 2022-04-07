Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 926DC4F7CF1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:34:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyRD3DVnz3bs9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:34:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SLDwl8ec;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632;
 helo=mail-ej1-x632.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SLDwl8ec; dkim-atps=neutral
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyMx39mNz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:09 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a6so9996862ejk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lwv0OP8MEFPtBT1zINZmdonMBn1rL8mDzX3cu0httRY=;
 b=SLDwl8ec7EHCqXB62Qaclx9H9Z03BrVF3nvNnoga4I5VZfbPOpFyWx7hdMyKpLk0L5
 z3nfcLccBKtNsEjzoUA6b5Pu+fz9792/cEu1a27jasM7TUKJWd/x+wWRJyaEVG4FdaRV
 /7s7hdtpwXHZct226CzucQgj6TqxEzUFHbtZr/VonFHBffWW79CYktfmQ9cipx2/pzx9
 lyAro41HtSPSzqW3d8BPaCWe0xbIcwf+6tOYAWs0w9/jXvCXf8/8ygF0xw4p2xVw0OaZ
 UK11nbosIluBfvkigCP3YQVGh5ttPc7NasebUN3VfoUdIN1TxlNQODRBfjH6mGpbozZ9
 xB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lwv0OP8MEFPtBT1zINZmdonMBn1rL8mDzX3cu0httRY=;
 b=F27Eo2XOsOC4jRblfYe0fkjLvrIgULLVfS9O1e5R370d/OIQXJxFDH/YzqqSAWxnpc
 aIVJrB0lxvedGebqGuys2Z+/6pdwn0LXUJGy+JmQCbnVaGOo6b70PIcPqHz8P41wBJDC
 P7FHUEzmUOMZOsBxOoifMz+sq9R7PGwiZCnKqB5zfRCBg6ghU4UY/THvCW9uEvWL/6I+
 JgRkRApCj5sNT2K/YIsq4utscsiqKSpl4Je4+I8wa4Hz6Svo4rUuDkJ1adaXlIWriHVg
 0iAcmS6t0aYfVgZra3rPLyPDfMNqe58qm5h3dCP/xdrllX4UqYJcC3lr4aFHbbXUeTfA
 mMUA==
X-Gm-Message-State: AOAM530pESoSBIcYniCqdIIr586gMLOhXOHjL6HYsRadmPQqIBM7Tv63
 o1vOK+sTJjPoXPs4yltvUt8=
X-Google-Smtp-Source: ABdhPJySSyY5aSv1i2XVaK+KgxwlfVUde9wvcEeXTd6ea85KAm10MyiuPJamgPE40HsgzTbz8Q01nQ==
X-Received: by 2002:a17:906:6a05:b0:6e7:f5c8:1d55 with SMTP id
 qw5-20020a1709066a0500b006e7f5c81d55mr12571266ejc.443.1649327465747; 
 Thu, 07 Apr 2022 03:31:05 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:05 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 04/15] net: dsa: Replace usage of found with
 dedicated list iterator variable
Date: Thu,  7 Apr 2022 12:28:49 +0200
Message-Id: <20220407102900.3086255-5-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407102900.3086255-1-jakobkoschel@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Vladimir Oltean <olteanv@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Casper Andersson <casper.casan@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 net/dsa/dsa.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
index 89c6c86e746f..645522c4dd4a 100644
--- a/net/dsa/dsa.c
+++ b/net/dsa/dsa.c
@@ -112,22 +112,21 @@ const struct dsa_device_ops *dsa_find_tagger_by_name(const char *buf)
 
 const struct dsa_device_ops *dsa_tag_driver_get(int tag_protocol)
 {
-	struct dsa_tag_driver *dsa_tag_driver;
+	struct dsa_tag_driver *dsa_tag_driver = NULL, *iter;
 	const struct dsa_device_ops *ops;
-	bool found = false;
 
 	request_module("%s%d", DSA_TAG_DRIVER_ALIAS, tag_protocol);
 
 	mutex_lock(&dsa_tag_drivers_lock);
-	list_for_each_entry(dsa_tag_driver, &dsa_tag_drivers_list, list) {
-		ops = dsa_tag_driver->ops;
+	list_for_each_entry(iter, &dsa_tag_drivers_list, list) {
+		ops = iter->ops;
 		if (ops->proto == tag_protocol) {
-			found = true;
+			dsa_tag_driver = iter;
 			break;
 		}
 	}
 
-	if (found) {
+	if (dsa_tag_driver) {
 		if (!try_module_get(dsa_tag_driver->owner))
 			ops = ERR_PTR(-ENOPROTOOPT);
 	} else {
-- 
2.25.1

