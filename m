Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9174E446BC3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 02:22:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HmKPV02lJz30G6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 12:22:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail header.b=C99TVb5B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.138;
 helo=mail-40138.protonmail.ch;
 envelope-from=stanley.johnson.001@protonmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=C99TVb5B; 
 dkim-atps=neutral
X-Greylist: delayed 111119 seconds by postgrey-1.36 at boromir;
 Sat, 06 Nov 2021 12:22:18 AEDT
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HmKNp4flpz2yPk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 12:22:18 +1100 (AEDT)
Date: Sat, 06 Nov 2021 01:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1636161732;
 bh=7eU3DoswAZXqswYK2fLMeKsAh2dqaI4/VsbH34QzPT4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=C99TVb5BZTmdsAagNPaW896/zCrnu642vTdRDqzLdE46nK5yeGZEqpxZfP9CxrglS
 Pf7N8NfZ1nH3rLku2OCkPA3D6qLKWL0WsZBtP9vslpiTNN4R/Ck5YXrm4GzwS6cC0M
 4JpeZ5F2Crt5zlK+JeCjnxVF0I8/WMcfFDQs2Ot0=
To: Christophe Leroy <christophe.leroy@csgroup.eu>
From: Stanley Johnson <stanley.johnson.001@protonmail.com>
Subject: Re: Fwd: Fwd: X stopped working with 5.14 on iBook
Message-ID: <FEtBUOuFPMN4zJy4bIOqz6C4xoliCbTxS7VtMKD6UZkbvEbycUceRgGAd7e9-trRdwVN3hWAbQi0qrNx8Zgn8niTQf2KPVdw-W35czDIaeQ=@protonmail.com>
In-Reply-To: <79ae1f49-f6b1-e9ad-977d-0cc7e553c7b9@csgroup.eu>
References: <6919111c-02fa-c6b9-bb05-04161e52f340@yahoo.com>
 <27ad38f3-c1a8-ac5c-8467-f311b5882a00@yahoo.com>
 <d5d0b396-7408-bdae-cf50-4b5f4e7b3184@csgroup.eu>
 <48c3ed15-2ecf-cc12-c287-2b61457f5fb@nippy.intranet>
 <a1e6c282-c8fd-9671-5df6-cd7ca06fdbb3@csgroup.eu>
 <de4b689-236e-505e-2632-6ce89110a1e9@linux-m68k.org>
 <79ae1f49-f6b1-e9ad-977d-0cc7e553c7b9@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1_RUJVVrvqX9gCVMlnLve6ggGJNFxp2CHilPPqHdALn0"
X-Spam-Status: No, score=-0.7 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Stanley Johnson <stanley.johnson.001@protonmail.com>
Cc: "Christopher M. Riedl" <cmr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Riccardo Mottola <riccardo.mottola@libero.it>,
 Finn Thain <fthain@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.

--b1_RUJVVrvqX9gCVMlnLve6ggGJNFxp2CHilPPqHdALn0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> ...
> I think I found the issue.
> __get_user_sigset() is wrong for 32 bits.
> Could you change its content to return __get_user((u64)&dst->sig[0],
> (u64 __user *)&src->sig[0]);
> If it works, for the mainline also change unsafe_get_user_sigset()
> Christophe

Christophe,

Using the attached patches and git commands provided by Finn (thanks!), her=
e are the results:

$ git reset --hard
$ git checkout d3ccc9781560
$ git am ../__get_user_sigset_cast.patch
$ cp ../dot-config-pmac-5.12.0-rc3-00034-gd3ccc9781560-USER_NS .config
$ make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnu- -j4 clean olddefco=
nfig vmlinux
$ grep USER_NS .config
CONFIG_USER_NS=3Dy
$ strings vmlinux | grep Linux.version
Linux version 5.12.0-rc3-pmac-00035-g77e46218520e (johnson@ThinkPad) (power=
pc-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils fo=
r Debian) 2.37) #146 SMP Fri Nov 5 18:57:46 MDT 2021

With this kernel, X works.

Trying mainline:
$ git reset --hard
$ git checkout v5.15
$ git am ../__get_user_sigset_cast_5.15.patch
$ cp ../dot-config-powermac-5.14 .config
$ ./scripts/config -e USER_NS
$ make ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc-linux-gnu- -j4 clean olddefco=
nfig vmlinux
$ grep USER_NS .config
CONFIG_USER_NS=3Dy
$ strings vmlinux | grep Linux.version
Linux version 5.15.0-pmac-00001-gbc0bc813b6ac (johnson@ThinkPad) (powerpc-l=
inux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for De=
bian) 2.37) #147 SMP Fri Nov 5 19:17:01 MDT 2021

With this kernel, X also works.

So it appears that your change has fixed the problem, at least on the G4 Cu=
be; thanks!

-Stan

--b1_RUJVVrvqX9gCVMlnLve6ggGJNFxp2CHilPPqHdALn0
Content-Type: application/octet-stream; name=__get_user_sigset_cast.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=__get_user_sigset_cast.patch

RnJvbSBhNmNkZDNlOWExMGQyOWRmMzhmYzZjODQ0NTE3YWIyOGQ2OTYxMjI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBj
c2dyb3VwLmV1Pg0KRGF0ZTogU2F0LCA2IE5vdiAyMDIxIDEwOjM2OjUyICsxMTAwDQpTdWJqZWN0
OiBbUEFUQ0hdIFJlOiBGd2Q6IEZ3ZDogWCBzdG9wcGVkIHdvcmtpbmcgd2l0aCA1LjE0IG9uIGlC
b29rDQoNCkkgdGhpbmsgSSBmb3VuZCB0aGUgaXNzdWUuDQoNCl9fZ2V0X3VzZXJfc2lnc2V0KCkg
aXMgd3JvbmcgZm9yIDMyIGJpdHMuDQoNCkNvdWxkIHlvdSBjaGFuZ2UgaXRzIGNvbnRlbnQgIHRv
IHJldHVybiBfX2dldF91c2VyKCoodTY0KikmZHN0LT5zaWdbMF0sICh1NjQNCl9fdXNlciAqKSZz
cmMtPnNpZ1swXSk7DQoNCklmIGl0IHdvcmtzLCBmb3IgdGhlIG1haW5saW5lIGFsc28gY2hhbmdl
IHVuc2FmZV9nZXRfdXNlcl9zaWdzZXQoKQ0KDQpDaHJpc3RvcGhlDQoNCmRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbC5oIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zaWduYWwu
aA0KaW5kZXggMTM5Mzg3NmYzODE0Li5kNGQxNzNhNzA5MTMgMTAwNjQ0DQotLS0gYS9hcmNoL3Bv
d2VycGMva2VybmVsL3NpZ25hbC5oDQorKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbC5o
DQpAQCAtMjMsNyArMjMsNyBAQCBzdGF0aWMgaW5saW5lIGludCBfX2dldF91c2VyX3NpZ3NldChz
aWdzZXRfdCAqZHN0LCBjb25zdCBzaWdzZXRfdCBfX3VzZXIgKnNyYykNCiB7DQogCUJVSUxEX0JV
R19PTihzaXplb2Yoc2lnc2V0X3QpICE9IHNpemVvZih1NjQpKTsNCiANCi0JcmV0dXJuIF9fZ2V0
X3VzZXIoZHN0LT5zaWdbMF0sICh1NjQgX191c2VyICopJnNyYy0+c2lnWzBdKTsNCisJcmV0dXJu
IF9fZ2V0X3VzZXIoKih1NjQqKSZkc3QtPnNpZ1swXSwgKHU2NCBfX3VzZXIgKikmc3JjLT5zaWdb
MF0pOw0KIH0NCiANCiAjaWZkZWYgQ09ORklHX1ZTWA0K

--b1_RUJVVrvqX9gCVMlnLve6ggGJNFxp2CHilPPqHdALn0
Content-Type: application/octet-stream; name=__get_user_sigset_cast_5.15.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=__get_user_sigset_cast_5.15.patch

RnJvbSA1ZjgwZDQ5ODRmNjJmNjBhNGJlYTc0OGU4NTA4ZDFiYWExNzFjMGE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBj
c2dyb3VwLmV1Pg0KRGF0ZTogU2F0LCA2IE5vdiAyMDIxIDEwOjM2OjUyICsxMTAwDQpTdWJqZWN0
OiBbUEFUQ0hdIEZ3ZDogRndkOiBYIHN0b3BwZWQgd29ya2luZyB3aXRoIDUuMTQgb24gaUJvb2sN
Cg0KSSB0aGluayBJIGZvdW5kIHRoZSBpc3N1ZS4NCg0KX19nZXRfdXNlcl9zaWdzZXQoKSBpcyB3
cm9uZyBmb3IgMzIgYml0cy4NCg0KQ291bGQgeW91IGNoYW5nZSBpdHMgY29udGVudCAgdG8gcmV0
dXJuIF9fZ2V0X3VzZXIoKih1NjQqKSZkc3QtPnNpZ1swXSwgKHU2NA0KX191c2VyICopJnNyYy0+
c2lnWzBdKTsNCg0KSWYgaXQgd29ya3MsIGZvciB0aGUgbWFpbmxpbmUgYWxzbyBjaGFuZ2UgdW5z
YWZlX2dldF91c2VyX3NpZ3NldCgpDQoNCkNocmlzdG9waGUNCg0KZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9rZXJuZWwvc2lnbmFsLmggYi9hcmNoL3Bvd2VycGMva2VybmVsL3NpZ25hbC5oDQpp
bmRleCAxZjA3MzE3OTY0ZTQuLmFiYThhOWU3NTFlOCAxMDA2NDQNCi0tLSBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvc2lnbmFsLmgNCisrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2lnbmFsLmgNCkBA
IC0yMywxMCArMjMsMTAgQEAgc3RhdGljIGlubGluZSBpbnQgX19nZXRfdXNlcl9zaWdzZXQoc2ln
c2V0X3QgKmRzdCwgY29uc3Qgc2lnc2V0X3QgX191c2VyICpzcmMpDQogew0KIAlCVUlMRF9CVUdf
T04oc2l6ZW9mKHNpZ3NldF90KSAhPSBzaXplb2YodTY0KSk7DQogDQotCXJldHVybiBfX2dldF91
c2VyKGRzdC0+c2lnWzBdLCAodTY0IF9fdXNlciAqKSZzcmMtPnNpZ1swXSk7DQorCXJldHVybiBf
X2dldF91c2VyKCoodTY0KikmZHN0LT5zaWdbMF0sICh1NjQgX191c2VyICopJnNyYy0+c2lnWzBd
KTsNCiB9DQogI2RlZmluZSB1bnNhZmVfZ2V0X3VzZXJfc2lnc2V0KGRzdCwgc3JjLCBsYWJlbCkg
XA0KLQl1bnNhZmVfZ2V0X3VzZXIoKGRzdCktPnNpZ1swXSwgKHU2NCBfX3VzZXIgKikmKHNyYykt
PnNpZ1swXSwgbGFiZWwpDQorCXVuc2FmZV9nZXRfdXNlcigqKHU2NCopJihkc3QpLT5zaWdbMF0s
ICh1NjQgX191c2VyICopJihzcmMpLT5zaWdbMF0sIGxhYmVsKQ0KIA0KICNpZmRlZiBDT05GSUdf
VlNYDQogZXh0ZXJuIHVuc2lnbmVkIGxvbmcgY29weV92c3hfdG9fdXNlcih2b2lkIF9fdXNlciAq
dG8sDQo=

--b1_RUJVVrvqX9gCVMlnLve6ggGJNFxp2CHilPPqHdALn0--

