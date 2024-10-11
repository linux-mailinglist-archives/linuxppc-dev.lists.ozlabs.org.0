Return-Path: <linuxppc-dev+bounces-2129-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B5E99AE07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 23:25:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQKRl3rSQz2yfj;
	Sat, 12 Oct 2024 08:25:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.17.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728663573;
	cv=none; b=agPDE9Jsxyakoa/nQwagELpGILIbNC51lVr5uGBj6Y+tk8vKWWH+M/YXZQmCsiTuxoYmiPQ7ngX9ON5q2Li7Fq/8nuOS6NbdeMdEzi89aMbb4Zvi8MTVc4/UPmQyBSFnIC0xRHFhcINChA6vVNzRSa/if1awBm0WY+lF5Uafc71YRwFlKzVBdsAAfZ/e18xUPjy2yhL67B6I7hwWHLfVjRCQ92zJlWYm275iDFY03cycB8SWHbkfpVsN1NRYW4M12vxlwFKqcONlvUDmVYBCOEpW8EGN8C53YDlDlK65b9kfRcbhoZqIQVNRkC/zd9H+qIWy8XWRvRaurjERAfOv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728663573; c=relaxed/relaxed;
	bh=DTkx67YeCxz63Ruh6fsf5H//CCWsfbXmJhTRx2qFiaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbY3cB3Saa1tWF+CAd069dcUTzn2YSY7PgJ1bU9Y4MFGUC9WbIqZr9kHS4ZCZZISfyR1DIOSwSjsz0G6nvxg5Ma9LEqfV2mI/6W5OE4bR1un8oij9O9eWIO1R/Sdv7GzgG7JUUqAsBurm5Q2uBoT28qwiMwsiJy3VJC545NOoTZK8c07URbzjNAM8c7ZfSm1mnnjWS5Odu2DQkpfSN1qtucP8B1wX64pAOMdjJjUX3cVO+/AGzj9OLdWRqs4blpAIyIQKXZ3RC2bGjVZlyJRgMTmvEtjKSibW8Frji7GwM7irYaPwWqINKMoJL85ANzXIr3Ef4tGvcsfJwZoJEHoTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=XmJXUbV3; dkim-atps=neutral; spf=pass (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=XmJXUbV3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQBfB63bhz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 03:19:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728663524; x=1729268324; i=markus.elfring@web.de;
	bh=DTkx67YeCxz63Ruh6fsf5H//CCWsfbXmJhTRx2qFiaI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XmJXUbV3VomOP2edKb/1Fqm4yHnBb0MUnBt9wwe1Jfvd8OXqh6VN+5JJA9N6klQi
	 i84vTwOCdwyxriRcZIgsB8X/tObPeQ+RwT1semsJhMMmxw9PjLTFe4ecZoKD6n/lU
	 5cpPHiCjDCMubMhu3XNHS3Y0WSRBfjyOxNTDKdQvIMtOuxU90PMKoAsHUmF6tH5s4
	 axlNBEZ+hn3dY1NqfYRm97pbLvPNjm9gv4hkPu9H6zQcdCtX9tjIJGPHai4Yf9Auw
	 hB/Rrem4hlCSSpm2tQ5YJm/fmu5BdlfQARDXxSwFhDLQrPtIpoOnxeh8joaRXQM1x
	 rn9a5Hn9l1y9yVM0IA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MLifq-1tGpCW3Awa-00LYIw; Fri, 11
 Oct 2024 18:18:44 +0200
Message-ID: <ede25e03-7a14-4787-ae1b-4fc9290add5a@web.de>
Date: Fri, 11 Oct 2024 18:18:42 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] powermac: Use of_property_match_string() in
 pmac_has_backlight_type()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, Jani Nikula <jani.nikula@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de>
 <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N8O2e4Yd8E0DvTB9GzAvLxn0nY0sITcEOqSjkIxd8kQmhPZmVqM
 dvk/RIK2R/oB3/C6vH0Za4HMmwzZt+MVAu2T/oW8Orss8Zk5+wW3pmJmLymePZ8QjxEBRgB
 /kUeUyNO1XiNX2igzwPABBHB5m50knkomXDgAOWWQqrRF28FQR+14I465PvgowRK10Jlf4J
 uGm6giXGKwnrulmV0VBkw==
UI-OutboundReport: notjunk:1;M01:P0:03Wv9VBsxxM=;Emklykv9AV86TehI7jARTBVzWrT
 gmVAPBuaUkIGkzIetN/j9chswkNCMekAnfGMW7UDksYMQDxzknkyAbYVY2glTnAWaJ6SUCdEv
 +ISapxLUpmQ+jSsy7/JOPSGeRaOW9oJ9gT6JozPbkwt3mzjwFGg1kg93q9qKNeZiDb20FQ7Z5
 7dbMyhRO7IoQUCPFRU2pZONu3UZ+PwYNSNA7N1tGZM7p8qMiOwqRfmUBo2iS8EcFOTrocBiqL
 vR9KrBxbxhFHxFQOntbrB+ofNBY1oMG+mzD2Oi/2mRZTiLus5YtdHlT6VgALTCKzquhq/mBG6
 XdjFGakaU/Stza/9COfiiH5iyPUI6uAAJCttGIVpSUG5z9tkinXh4XvAXjk4urs7M73Vw7KIK
 xE21MPozV9FlUQb3Opkk98YS70fV3YUULDZOU6Qvu2zmUaPY9ixhX5NyzY5SP9odV0PnWxHyr
 BYq2hkAoaS2HU/MBRTsNWelKG3FI9aPBERKHXvuG3E2k5JmOemMYE+BzRONFM5CaCvik5fwGX
 9sUOEfXXxhh+7RHjfwsJhE0WF+ItPzhXW9OIob5f9tF100PLWUf38y79dHx4IGMkObCdJN5JF
 qfeQ2Ppv8pROtfNg+pv5LEZqmP2DUAz6t1RjssIlq+81k5qhbtsHVza0m9CDqpsQ6F1M4G0oR
 oftcGu5QqkU7IxiFPxZICiHYS6HSlj2Nsbr+NVGBMDgtSY+OVStYecDG6lfmICKYpIbFTZpnQ
 Hz20Ms1RAi6CWFzy13lupfmOZCYYVsrtzxEMVIIkHlh3l9gZc4JNmP+uRiY5alGgAOXJwh3st
 W8Jk6EgV8+Np5xz1nktIgPwg==
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Oct 2024 18:10:06 +0200

Replace an of_get_property() call by of_property_match_string()
so that this function implementation can be simplified.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Link: https://lore.kernel.org/linuxppc-dev/d9bdc1b6-ea7e-47aa-80aa-02ae649=
abf72@csgroup.eu/
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/linuxppc-dev/87cyk97ufp.fsf@mail.lhotse/
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/powermac/backlight.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/pl=
atforms/powermac/backlight.c
index 12bc01353bd3..79741370c40c 100644
=2D-- a/arch/powerpc/platforms/powermac/backlight.c
+++ b/arch/powerpc/platforms/powermac/backlight.c
@@ -57,18 +57,10 @@ struct backlight_device *pmac_backlight;
 int pmac_has_backlight_type(const char *type)
 {
 	struct device_node* bk_node =3D of_find_node_by_name(NULL, "backlight");
+	int i =3D of_property_match_string(bk_node, "backlight-control", type);

-	if (bk_node) {
-		const char *prop =3D of_get_property(bk_node,
-				"backlight-control", NULL);
-		if (prop && strncmp(prop, type, strlen(type)) =3D=3D 0) {
-			of_node_put(bk_node);
-			return 1;
-		}
-		of_node_put(bk_node);
-	}
-
-	return 0;
+	of_node_put(bk_node);
+	return i >=3D 0;
 }

 static void pmac_backlight_key_worker(struct work_struct *work)
=2D-
2.46.1


