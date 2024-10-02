Return-Path: <linuxppc-dev+bounces-1737-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 389ED98E4A6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 23:13:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJnbl6LW2z2yVF;
	Thu,  3 Oct 2024 07:13:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727899399;
	cv=none; b=RRYNISfTdQw6sPVaFVaqaAR+Peg7bXGtdNa0OwxeD4npwCZiXZFaNT6OJ5qdSIi9LOPVJgZhcMBvqqSX8S3eBC4nXaX4ZrTdzKsgSqZhE/xPKuEz5T42EiSNMJc1AEM4cfOWclv5UxIc3S6einGhNuhXJbh90up1R7mBpsd+VioUmJi8PNMRV3zBHv4ahrUJ7Br8rP5zjAoaE7N/DeawgLJmq+8VzPjUD5gytnG9QAUYVJJ0u8qIJsqCA0xbLL1kGcjcddMQnkPrLH3GQopY7dBRxYTlXQ0GL6T7vcci+DMD3/Sl7WFWdq+RQ6uJtJjMdZOxtZBjj63vlCKUctSSEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727899399; c=relaxed/relaxed;
	bh=yk/JBSOBkQ1LKGKPJgjsG+d2d+2WBIGfUs3k8xorprg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Yj6ygmevPf/3IdCGKp0PvrlyMdxt5nbFVKome2vsDNPHs0BMVcVse86XSqR5JF/njux3H32ss9SXsL/9Y5+1v2KN8atV95YpkKKEXe/7nins29FIJB0pAL8jkfSz90HyOpLJce9x0L6Si0B20DqhoA+L5sTuKZI2AjBdFMBeyFEZ0jQe5R6g0v/Lv9mfbrY1huPzabZsq8g4iYqkeYjiO5ettWk6xlYjbWM+uR5XkngJbW740/RIv6rWYCdxrAvRV5jHYB8qLfDbK23my/in2cAqbxeNR5HR+gInhDRj9tQCSGEcD+1RF/6zioV9xkG/0bNsmglasDeEi2UFjGfdBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=vJh3uWvY; dkim-atps=neutral; spf=pass (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=vJh3uWvY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJm2X6wwLz2yQn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 06:03:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727899342; x=1728504142; i=markus.elfring@web.de;
	bh=yk/JBSOBkQ1LKGKPJgjsG+d2d+2WBIGfUs3k8xorprg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vJh3uWvY+YI4HwG+Oop6AdrCMM/hC36uMebPO+Z/0+2j5obO0oaV+VEoEEypGxf4
	 K1fHJNZB1pF5m+rwMUANcpzvZawtGsRapzTV5BeDm1GHH0L20GjyMFb5IQJpD2S03
	 vonCVDWDDLjwHNicMTKwFzxihVTegFmexgJmAJViy+cjnrev6fcwSjmGqXaB+8PTE
	 nIJ/yWtaXmcFZm6GX9Xy5y2E+5u3LDtECmCtnwoQ/i7dM3tlb3SFND9dDnJXjY4hz
	 z0VSvqHX10a/tkGG2I38nDCNnedG0GjHCfIMigr9uWlolXcpU/93UgwlPUITgPZV9
	 2E/+iBVuRq+glIY7HA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mav6t-1sKpr33AIV-00d27Y; Wed, 02
 Oct 2024 22:02:22 +0200
Message-ID: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de>
Date: Wed, 2 Oct 2024 22:02:20 +0200
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
To: linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jani Nikula <jani.nikula@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] powermac: Call of_node_put(bk_node) only once in
 pmac_has_backlight_type()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hKihFzh+xQoapC4KB1f813ixscEmHDPGUzMwuYAGUbLDglss0wb
 aW1DRTpfjmTzAnntPjK4MUjjYybAkBJsvTKYbf4BiOL1MIfuY+vOQC4V8VuMjXrM8OeMu7K
 /YnNfHSJaBVEQSyddEI15nrtpuVaNLW+IpzMvcjtsNH1IUPdyxetpjcQGjAD2/ohTb28UrV
 S2d7mD6JlNhWOuly+q0nA==
UI-OutboundReport: notjunk:1;M01:P0:i5Qz6h6TJGI=;vi/+cqtGm3/O6HJzmQA8MyVuEcJ
 gnYaMhZqJzvwOLwF+Y8odsmfGi0zMGEJ+jIV430l1sse3ntrvjGfQ1YoXDGZ3ybIIjyG+Jwf0
 tapsJNQqHFFFJTXztb+oYwXm9ifnmxd2qp1BlS1ROvH1TxlIjgn2/V6gvBFgkXIGh7o/Wi1bN
 nTjvwAIxlDdzk2ll0V246EHCEtOyYJdzXBcUbHEhiCST+2gymhY6tDq9UAsXWspBHy0AjPixQ
 GNnIoStVgXi3jhbMEDPIZcWgbCytgVAI8qGC6gU9N5lRkdA9gwne4uHM9LV1yxPSM2888jfui
 13Nig+mIFTBu4IlJLFKM8JommUTVPguflFHjDZwJRIQZmegta25NJT8MsHFWTe1h+UK6AoLn2
 jKGwkEeKcQl0tlPUqJZnUxex2V9FvSGhe8DSgOMyYzCo7rfteczvgeYCyNOySr3wVcst9B9zf
 Ta29slZPO+tYiGGJpzd1tbY78cE8IX8i0zZrsM5wCtEmMZoRwtBeXhhPlE3NCFKXAGDClQ45s
 XJvCzRffCS6lxzwz8PnKZzyAfHy42uj+jY0mYm9ylFH2GVl5wTF2KWKk7RLrgNFxnbYHt75KU
 PFxXp2GZqYabtgKIRHjYRz3D2mOcyWH/71R7VZoEB0lmzejIbrX2iiln5TDar9HXA3rLPZtBF
 asQdpVbd0CB5xwzeKsooemCRBkk6dQ3y1bGGwmuG8gFsmozG5KTR4uvVHoFjxhnWupdV2X9ue
 0pqh760jpB4Ls1+VuoUT1jwcg02jQlP+K0ed9GtcywbuoST3JBILwUY9Ckrv+iOg3qmxV7lW0
 ux5vDQ19KuZHrPIPMMkOZsDA==
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 2 Oct 2024 21:50:27 +0200

An of_node_put(bk_node) call was immediately used after a pointer check
for an of_get_property() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/powermac/backlight.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/pl=
atforms/powermac/backlight.c
index 12bc01353bd3..d3666595a62e 100644
=2D-- a/arch/powerpc/platforms/powermac/backlight.c
+++ b/arch/powerpc/platforms/powermac/backlight.c
@@ -61,11 +61,9 @@ int pmac_has_backlight_type(const char *type)
 	if (bk_node) {
 		const char *prop =3D of_get_property(bk_node,
 				"backlight-control", NULL);
-		if (prop && strncmp(prop, type, strlen(type)) =3D=3D 0) {
-			of_node_put(bk_node);
-			return 1;
-		}
 		of_node_put(bk_node);
+		if (prop && strncmp(prop, type, strlen(type)) =3D=3D 0)
+			return 1;
 	}

 	return 0;
=2D-
2.46.1


