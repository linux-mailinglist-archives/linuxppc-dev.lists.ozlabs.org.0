Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C552E6A61B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 22:47:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PR9v84vcPz3cDc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 08:47:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=thaison-nguyen.de header.i=@thaison-nguyen.de header.a=rsa-sha256 header.s=dkim header.b=UifGkO2l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=thaison-nguyen.de (client-ip=5.45.104.163; helo=mail.thaison-nguyen.de; envelope-from=mail@thaison-nguyen.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=thaison-nguyen.de header.i=@thaison-nguyen.de header.a=rsa-sha256 header.s=dkim header.b=UifGkO2l;
	dkim-atps=neutral
X-Greylist: delayed 521 seconds by postgrey-1.36 at boromir; Wed, 01 Mar 2023 08:26:17 AEDT
Received: from mail.thaison-nguyen.de (thaison-nguyen.de [5.45.104.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PR9Qx3RMKz2yMX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 08:26:17 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id B12CDE391A
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 22:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thaison-nguyen.de;
	s=dkim; t=1677619040; h=from:subject:date:message-id:to:mime-version:content-type;
	bh=VTnWT3vJ0Q5OlcbKZCdzA4gxcVNUemRq8All1kMY07k=;
	b=UifGkO2lfU/nlTsiU82B1wZf63OVVcE0zKuBCad4QTfjkb58cRPpd670NfCY3g3wp58hXJ
	SDfjNikTLKKi7NpcFeolvwWOIPCvE+I520tyFqCSCmN/RWIxud/PoG7XI1lrD8xFWRElJi
	TM5S91JQ0vLyNL2IcXDW1QzKJjz+IKmdT2ShsNZWKwuzT4655HBoAxe0I3nbvuB41O7ewf
	+pMJ1iTYfcUvoAucl3ZEymAVY7Gy5/313dbdF7y+xpXpD091hmBL9eeNDbXRq646sFdAfa
	NagMLSxBUJAx2s0MF/ZFqPeNoWK3v7an1cFNaqtdmZkSRR/3RsJi1FhC8yFjsA==
Date: Tue, 28 Feb 2023 22:17:19 +0100
Subject: Patch for audio on iBook G4 (powerbook6,5)
Importance: Normal
Message-ID: <ey8hrui03zsh-rkihqz2n7u2i8dd3ja32qgpr-1mta0e-nkf4tu8c3cc4vwcuq-49fkuy-mta0mx-f9h480-wnl3d8-pcij4tmg3beq2a3p39-rkd67kmq9hs4iz08io-uvtksdl00562enem8stlzawo.1677618681472@email.android.com>
From: "mail@thaison-nguyen.de" <mail@thaison-nguyen.de>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="--_com.android.email_1932772095507150"
X-Last-TLS-Session-Version: None
X-Mailman-Approved-At: Wed, 01 Mar 2023 08:46:30 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

----_com.android.email_1932772095507150
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPkhpPGRpdj48YnIgLz48L2Rpdj48ZGl2PkkgaGF2ZSBhZGRlZCBhIGJ1
ZyByZXBvcnQgYW5kIGEgcGF0Y2ggcmVnYXJkaW5nIGF1ZGlvIGZvciBpQm9vayBHNCAocG93ZXJi
b29rNiw1KSBvbiBrZXJuZWwub3JnIGJ1Z3ppbGxhLCBidXQgbm9ib2R5IGhhcyBwaWNrZWQgaXQg
dXAuPC9kaXY+PGRpdj48ZGl2Pmh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQmIzYxOzIxNjUwNDwvZGl2PjwvZGl2PjxkaXY+PGJyIC8+PC9kaXY+PGRpdj5Ob3cgSSBh
bSB0cnlpbmcgdG8gc3VibWl0IHRoZSBwYXRjaCBoZXJlLjwvZGl2PjxkaXY+PGJyIC8+PC9kaXY+
PGRpdj5CZXN0LMKgPC9kaXY+PGRpdj5UaGFpc29uPC9kaXY+PGRpdj48YnIgLz48L2Rpdj48ZGl2
PjxiciAvPjwvZGl2PjwvZGl2Pg==
----_com.android.email_1932772095507150
Content-Type: text/x-diff;
 name="audio.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="audio.patch";
 size=1246

LS0tIGZpbGVfbm90X3NwZWNpZmllZF9pbl9kaWZmCQorKysgZmlsZV9ub3Rfc3BlY2lmaWVkX2lu
X2RpZmYJCkBAIC0sICssIEBAIAotLS0gYS9zb3VuZC9hb2EvZmFicmljcy9sYXlvdXQuYworKysg
Yi9zb3VuZC9hb2EvZmFicmljcy9sYXlvdXQuYwpAQCAtMTExLDcgKzExMSw5IEBAIAogTU9EVUxF
X0FMSUFTKCJhb2EtZGV2aWNlLWlkLTE0Iik7CiBNT0RVTEVfQUxJQVMoImFvYS1kZXZpY2UtaWQt
MjIiKTsKIE1PRFVMRV9BTElBUygiYW9hLWRldmljZS1pZC0zMSIpOwogTU9EVUxFX0FMSUFTKCJh
b2EtZGV2aWNlLWlkLTM1Iik7CitNT0RVTEVfQUxJQVMoImFvYS1kZXZpY2UtaWQtMzgiKTsKK01P
RFVMRV9BTElBUygiYW9hLWRldmljZS1pZC00MCIpOwogTU9EVUxFX0FMSUFTKCJhb2EtZGV2aWNl
LWlkLTQ0Iik7CiAKIC8qIG9ueXggd2l0aCBhbGwgYnV0IG1pY3JvcGhvbmUgY29ubmVjdGVkICov
CkBAIC0zNjgsNyArMzY4LDIwIEBAIAogCQkuY29ubmVjdGlvbnMgPSB0YXNfY29ubmVjdGlvbnNf
bm9saW5lb3V0LAogCSAgfSwKIAl9LAorCS8qIFBvd2VyQm9vazYsNCAqLworCXsgLmRldmljZV9p
ZCA9IDQwLAorCSAgLmNvZGVjc1swXSA9IHsKKwkJLm5hbWUgPSAidGFzIiwKKwkJLmNvbm5lY3Rp
b25zID0gdGFzX2Nvbm5lY3Rpb25zX2FsbCwKKwkgIH0sCisJfSwKIAkvKiBQb3dlckJvb2s2LDUg
Ki8KKwl7IC5kZXZpY2VfaWQgPSAzOCwKKwkgIC5jb2RlY3NbMF0gPSB7CisJCS5uYW1lID0gInRh
cyIsCisJCS5jb25uZWN0aW9ucyA9IHRhc19jb25uZWN0aW9uc19hbGwsCisJICB9LAorCX0sCiAJ
eyAuZGV2aWNlX2lkID0gNDQsCiAJICAuY29kZWNzWzBdID0gewogCQkubmFtZSA9ICJ0YXMiLAot
LS0gYS9zb3VuZC9hb2Evc291bmRidXMvaTJzYnVzL2NvcmUuYworKysgYi9zb3VuZC9hb2Evc291
bmRidXMvaTJzYnVzL2NvcmUuYwpAQCAtMTk3LDcgKzE5Nyw3IEBAIAogCQkJICogc28gcmVzdHJp
Y3QgdG8gdGhvc2Ugd2UgZG8gaGFuZGxlIGZvciBub3cuCiAJCQkgKi8KIAkJCWlmIChpZCAmJiAo
KmlkID09IDIyIHx8ICppZCA9PSAxNCB8fCAqaWQgPT0gMzUgfHwKLQkJCQkgICAqaWQgPT0gMzEg
fHwgKmlkID09IDQ0KSkgeworCQkJCSAgICppZCA9PSAzMSB8fCAqaWQgPT0gNDQgfHwgKmlkID09
IDQwIHx8ICppZCA9PSAzOCkpIHsKIAkJCQlzbnByaW50ZihkZXYtPnNvdW5kLm1vZGFsaWFzLCAz
MiwKIAkJCQkJICJhb2EtZGV2aWNlLWlkLSVkIiwgKmlkKTsKIAkJCQlvayA9IDE7Cg==


----_com.android.email_1932772095507150--

