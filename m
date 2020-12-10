Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA7A2D6042
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 16:46:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsJDz1p0ZzDqyj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 02:46:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=217.72.192.78; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=Zq9dwLUg; 
 dkim-atps=neutral
X-Greylist: delayed 939 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Dec 2020 01:53:24 AEDT
Received: from mout.web.de (mout.web.de [217.72.192.78])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsH3S25qwzDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 01:53:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1607611993;
 bh=IipN9KELoH1llXbnl7PYP+Xgs4zMteApDSsWAHUq6nk=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=Zq9dwLUgU8iVqqlbn4GMSNj+x1l1qNJVefLvzJ44J8EjWaKmi3WL41Xwn2io89sZl
 3k4ZdU+Sux6QMVjcayKl14w1CFl+KaDgVnmwMOfxoXPG2ZHUg5C/RDalJHp9f+53ql
 nKb0ZP09rp1lFZt+DXq479K34H+A2cPDQDccBnkM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.143.229]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M6DyQ-1ju1JA33es-00yB8K; Thu, 10
 Dec 2020 15:35:46 +0100
To: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: =?UTF-8?Q?=5bPATCH=5d_cxl=3a_Reduce_scope_for_the_variable_?=
 =?UTF-8?B?4oCcbW3igJ0gaW4gY3hsbGliX2dldF9QRV9hdHRyaWJ1dGVzKCk=?=
Message-ID: <5cee2b25-71e0-15aa-fba6-12211b8308aa@web.de>
Date: Thu, 10 Dec 2020 15:35:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:I9GvSD7sY0LrvYXLrpAJyCDjsLLhfJaZH4xqXgtQEePlJLN9Qp0
 o30C3CVvdTgov79WZKNXk77+SfXqPuyFPVuvxdweTwv/cQbJMt4NCIJnmHZ7Yt6XfGQ9vkG
 NfpF983CJx2/3dBRm6jdYWur0aTOtOPTKpLXYjg6/Scf7Ir5pJERS4cJDLG8jtZslr+ONa3
 tKzSMOjD3isutCqkFV6SA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:70kl2OJuxB4=:RjjB3ZFpvgCtQOndk1f2aH
 QqUOO9vX/8Vzu+IKLhRAT9S+ezsektKwv4s90geuiceNHpD2HUrAxGTfsUEIN/Ptt/tncRY4q
 IYyrzFDILSKrVWv0qpErk3MoQWNmqMCIATeAUs2tborg1FOPAnrpBHSE4jnqCzXkQSfVP5K0Q
 1TnC9TpZXc1A5HOl8VsD1bn3jGaAIvZs9sBiLFCs1L0GdA2tCPMnA1AQTIYzk+jH4akQBjSYA
 ljvz+uFtEzjYr9ufzCqzOiiOyzYQXTj1Fs/4k2iFFMY9O7kMBvcVAklJpnB97mSl221EJfqPT
 V9Brx5InOVZFqyvtBgo6MycUzlh3ED1ykRbfUDWEM2i/5aOY49TGd01SNvp6rq2QcbA3Yeux1
 bMfmvDvVhjRFwJ4oer1Yw+HOO/WRz4eoBKfiZfW9/bgDffKiPvfBjIG9jEM/IhT7GOzgIs8+h
 lubp6ynEm3Ew1k6evbICqfUct/QixcAuBECcOxtKnL9KSOvBFusTP+D6w3R5GS6B0wRPSHbbD
 TIkSZlM7wa2nsOMvVFWMy1fp4nTng2jsm+7Ar4jwLmGHlhk+Nb//ZhWef7J2kbAYm5lBVGZy1
 UsMf6o0F+iL04iOytvoL9i9CtXrqOuOAm94BXkETUpouWpEpnIdBjTZA9W2Nc2LweZTBlV5EV
 5KAdg8s73CPStvvIao2EVMVvyL5NMrbl6ri2Tdkq4ZgVFbCfm8GIPVRPHOTQ/BEIU/ZCj3ZY9
 05K/58jvmWoqrjNh2z7UAILv2DBi76UTnvO/ezi2TVxn/G/wjaopIgYXE1qRIuvDRUuomQ2hN
 UIhUt7jesk0w33v0J9kViXhWVxf/eUgGjKBvE4lYniEPWzzsXqG9LjXqDYrOEiXwF3yq9Tl1q
 B1XZBpw/w4hdETO/YIsw==
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Dec 2020 14:14:07 +0100

A local variable was used only within an if branch.
Thus move the definition for the variable =E2=80=9Cmm=E2=80=9D into the co=
rresponding
code block.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/misc/cxl/cxllib.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/cxl/cxllib.c b/drivers/misc/cxl/cxllib.c
index 2a1783f32254..53b919856426 100644
=2D-- a/drivers/misc/cxl/cxllib.c
+++ b/drivers/misc/cxl/cxllib.c
@@ -170,8 +170,6 @@ int cxllib_get_PE_attributes(struct task_struct *task,
 			     unsigned long translation_mode,
 			     struct cxllib_pe_attributes *attr)
 {
-	struct mm_struct *mm =3D NULL;
-
 	if (translation_mode !=3D CXL_TRANSLATED_MODE &&
 		translation_mode !=3D CXL_REAL_MODE)
 		return -EINVAL;
@@ -182,7 +180,7 @@ int cxllib_get_PE_attributes(struct task_struct *task,
 				true);
 	attr->lpid =3D mfspr(SPRN_LPID);
 	if (task) {
-		mm =3D get_task_mm(task);
+		struct mm_struct *mm =3D get_task_mm(task);
 		if (mm =3D=3D NULL)
 			return -EINVAL;
 		/*
=2D-
2.29.2

