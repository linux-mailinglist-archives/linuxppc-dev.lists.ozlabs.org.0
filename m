Return-Path: <linuxppc-dev+bounces-8912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E24AC1FAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 11:24:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3fqj4STmz2ysb;
	Fri, 23 May 2025 19:24:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747992257;
	cv=none; b=jQ0EB91sknHLOLjQ2JxJD+KAt+apN+LbTn5NcZpVa9un6LaRZ/gvvLMR8eMTqHlmftrM8Rd2KGjKJ+v7yT/ccVpm7CO3DDZKAMIammjxHVT+V1X2CBvAAJx5dwlEBLBJ1rXAB0bf1Kvzl4aUenudot46ef9gpeYwr3yZ596qLOihZwHxy31dDa9U8xxChB47clH+m4o7oBNNvW/FpyUXpgtf0NxNAQh5GpaGGSvnFc3HL+O9eNqd0X8cZAsr/RKVS5waNb6gG4f1Y7po/w1HXgVq/RqLUlXHjMifaaEvKWpBYQla+v/rJ7Bstu9Hknu+t9p/bPDmFqlbat6SRz/DUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747992257; c=relaxed/relaxed;
	bh=X6Wp3A8TWITXqZohD4WlHFJyenrR7DH4/8loE7ShtGM=;
	h=From:Subject:To:Cc:Date:Message-ID:MIME-Version:Content-Type; b=LM9xLeEy5F5q3Qq17kHzmn8LbQyYLM5OCAm7ZfMAbarLufVRhhszUeMWvlYS3VP+Q/QZQXd3984SVgZo8bUl9YPWbHoxty3Itht30WXUmN97Wnv2AaXJviw6AsMRs769Z6MRtNBcsj15HHopE1z5EjyiuR4C6zNtVDkM2SnM6wTxUQhkBHNWI30uKD+YzkIUGosSN9I34JrQ0CQV6sUSQH6/b7WOIHpzHOuXCKX5G5BR6YX+IqgnWuJ8bE2qhChM4NHwuklLAo58LPZcv4Y7IJLV9tSyaZvC/1MyhxuVDMyK8RBQ3Gx67Icfove++y/F+wPeiDsB9+jTajlMWH8SLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org) smtp.mailfrom=kylinos.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=aichao@kylinos.cn; receiver=lists.ozlabs.org)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3fqg65szz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 19:24:14 +1000 (AEST)
X-UUID: 8671aa7c37b711f0b29709d653e92f7d-20250523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:2e58fa42-b8ce-4bba-9d6d-327b9302030a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:c78fe3664896915b74f47d4b192bc52f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:83|102,TC:0,Content:0|50,EDM:40,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8671aa7c37b711f0b29709d653e92f7d-20250523
Received: from mail.kylinos.cn [(10.44.16.189)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1853619818; Fri, 23 May 2025 17:23:02 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id E477D700ADB2;
	Fri, 23 May 2025 17:23:01 +0800 (CST)
Received: by mail.kylinos.cn (NSMail, from userid 0)
	id D29C7700ADAB; Fri, 23 May 2025 17:23:01 +0800 (CST)
From: =?UTF-8?B?6Im+6LaF?= <aichao@kylinos.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAyLzZdIEFTb0M6IGFvYTogVXNlIGhlbHBlciBmdW5jdGlvbiBmb3JfZWFjaF9jaGlsZF9vZl9ub2RlX3Njb3BlZCgp?=
To: 	=?UTF-8?B?Sm9oYW5uZXMgQmVyZw==?= <johannes@sipsolutions.net>,
	=?UTF-8?B?cGVyZXg=?= <perex@perex.cz>,
	=?UTF-8?B?dGl3YWk=?= <tiwai@suse.com>,
	=?UTF-8?B?a3VuaW5vcmkubW9yaW1vdG8uZ3g=?= <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?B?bGdpcmR3b29k?= <lgirdwood@gmail.com>,
	=?UTF-8?B?YnJvb25pZQ==?= <broonie@kernel.org>,
	=?UTF-8?B?amJydW5ldA==?= <jbrunet@baylibre.com>,
	=?UTF-8?B?bmVpbC5hcm1zdHJvbmc=?= <neil.armstrong@linaro.org>,
	=?UTF-8?B?a2hpbG1hbg==?= <khilman@baylibre.com>,
	=?UTF-8?B?bWFydGluLmJsdW1lbnN0aW5nbA==?= <martin.blumenstingl@googlemail.com>,
	=?UTF-8?B?c2hlbmdqaXUud2FuZw==?= <shengjiu.wang@gmail.com>,
	=?UTF-8?B?WGl1Ym8uTGVl?= <Xiubo.Lee@gmail.com>,
	=?UTF-8?B?ZmVzdGV2YW0=?= <festevam@gmail.com>,
	=?UTF-8?B?bmljb2xlb3RzdWth?= <nicoleotsuka@gmail.com>,
	=?UTF-8?B?c2hhd25ndW8=?= <shawnguo@kernel.org>,
	=?UTF-8?B?cy5oYXVlcg==?= <s.hauer@pengutronix.de>,
	=?UTF-8?B?c3Jpbml2YXMua2FuZGFnYXRsYQ==?= <srinivas.kandagatla@linaro.org>,
Cc: 	=?UTF-8?B?bGludXgtc291bmQ=?= <linux-sound@vger.kernel.org>,
	=?UTF-8?B?bGludXgta2VybmVs?= <linux-kernel@vger.kernel.org>,
	=?UTF-8?B?bGludXhwcGMtZGV2?= <linuxppc-dev@lists.ozlabs.org>,
	=?UTF-8?B?bGludXgtcmVuZXNhcy1zb2M=?= <linux-renesas-soc@vger.kernel.org>,
	=?UTF-8?B?bGludXgtYXJtLWtlcm5lbA==?= <linux-arm-kernel@lists.infradead.org>,
	=?UTF-8?B?bGludXgtYW1sb2dpYw==?= <linux-amlogic@lists.infradead.org>,
	=?UTF-8?B?aW14?= <imx@lists.linux.dev>,
	=?UTF-8?B?a2VybmVs?= <kernel@pengutronix.de>,
	=?UTF-8?B?bGludXgtYXJtLW1zbQ==?= <linux-arm-msm@vger.kernel.org>,
Date: Fri, 23 May 2025 17:23:00 +0800
X-Mailer: NSMAIL 7.0.0
Message-ID: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
X-Israising: 0
X-Seclevel-1: 0
X-Seclevel: 0
X-Delaysendtime: Fri, 23 May 2025 17:23:00 +0800
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
Content-Type: multipart/mixed; boundary=nsmail-2dtffe8yxzg-2dthz9vt1n1
X-ns-mid: webmail-68303e74-2do7ub4i
X-ope-from: <aichao@kylinos.cn>
X-Spam-Status: No, score=0.7 required=3.0 tests=HTML_MESSAGE,
	HTML_MIME_NO_HTML_TAG,MIME_HTML_ONLY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This message is in MIME format.

--nsmail-2dtffe8yxzg-2dthz9vt1n1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0idmlld2VyX3BhcnQiIHN0eWxlPSJwb3NpdGlvbjogcmVs
YXRpdmU7Ij4KPGRpdj5IaSBKb2hhbm5lczo8YnI+PGJyPiZndDsgR2l2ZW4g
dGhlIHN0cnVjdHVyZSBvZiB0aGlzIGNvZGUsIHRoaXMgZWl0aGVyIGZpeGVz
IGEgbGVhaywgb3IgaXMgd3JvbmcuPGJyPiZndDsgSSByZWFsbHkgZG9uJ3Qg
a25vdyB3aGljaCBvZiB0aG9zZSB0d28gaXQgaXMsIGl0J3MgYmVlbiBkZWNh
ZGVzLCBidXQ8YnI+Jmd0OyBlaXRoZXIgd2F5IGl0J3Mgbm90IGEgY2hhbmdl
IHRoYXQgc2ltcGx5ICJzaW1wbGlmW2llc10gdGhlIGNvZGUiLjxicj48YnI+
QWJvdXQgZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZSgpIGluIGZpbGUgb2YuaCA6
PGJyPjxicj4jZGVmaW5lIGZvcl9lYWNoX2NoaWxkX29mX25vZGUocGFyZW50
LCBjaGlsZCkgXDxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsgZm9yIChjaGlsZCA9IG9mX2dldF9uZXh0X2NoaWxkKHBh
cmVudCwgTlVMTCk7IGNoaWxkICE9IE5VTEw7IFw8YnI+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7IGNoaWxkID0gb2ZfZ2V0X25leHRfY2hpbGQocGFy
ZW50LCBjaGlsZCkpPGJyPjxicj5vZl9nZXRfbmV4dF9jaGlsZCgpIHdpbGwg
dXNlZCBvZl9ub2RlX2dldCgpIGluY3JlbWVudCByZWZjb3VudCBvZiBhIG5v
ZGUuPGJyPjxicj5Tbywgd2UgbmVlZCB1c2VkIG9mX25vZGVfcHV0KCkgdG8g
ZGVjcmVtZW50IHJlZmNvdW50IG9mIGEgbm9kZS48YnI+PGJyPkFuZCB0aGUg
Zm9yX2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQoKSBoZWxwZXIgcHJvdmlk
ZXMgYSBzY29wZS1iYXNlZCA8YnI+Y2xlYW4tdXAgZnVuY3Rpb25hbGl0eSB0
byBwdXQgdGhlIGRldmljZV9ub2RlIGF1dG9tYXRpY2FsbHksIGFuZCBhcyA8
YnI+c3VjaCwgdGhlcmUgaXMgbm8gbmVlZCB0byBjYWxsIG9mX25vZGVfcHV0
KCkgZGlyZWN0bHkuPGJyPjxicj4ic2ltcGxpZmllcyB0aGUgY29kZSIgaXMg
bm8gbmVlZCB0byBjYWxsb2Zfbm9kZV9wdXQoKSAuPGJyPjxicj48YnI+PGJy
Pi0tIDxicj5XaXRoIGJlc3Qgd2lzaGVzPGJyPkFpIENoYW88YnI+PGJyPjwv
ZGl2Pgo8L2Rpdj4KPHA+Jm5ic3A7PC9wPgo8cD4mbmJzcDs8L3A+CjxwPi0t
LS08L3A+CjxkaXYgaWQ9ImNzMmNfbWFpbF9zaWdhdHVyZSI+PC9kaXY+Cjxw
PiZuYnNwOzwvcD4KPHA+Jm5ic3A7PC9wPgo8cD4mbmJzcDs8L3A+

--nsmail-2dtffe8yxzg-2dthz9vt1n1--

