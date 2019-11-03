Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36840ED364
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2019 13:49:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475bN30nRRzF5m7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2019 23:49:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.17.12; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.b="mCFDleIZ"; 
 dkim-atps=neutral
X-Greylist: delayed 851 seconds by postgrey-1.36 at bilbo;
 Sun, 03 Nov 2019 23:46:18 AEDT
Received: from mout.web.de (mout.web.de [212.227.17.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475bJp1Z1qzDqJl
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Nov 2019 23:46:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1572785161;
 bh=ByqX8/BbJJMQuJK30TWcd8h/CfuGh5FVHwsdxMU69s4=;
 h=X-UI-Sender-Class:To:From:Subject:Cc:Date;
 b=mCFDleIZHYOfzv8oUlMjanUZKBR0VKDyZafIUlE4I3aI+1Jypvl/UujekA3ut84wq
 +mCBnEhpQzVQPq/hTiiFld+96hHt1+p6QcYhC8huKi41T2QU+iN8HLhjIoMl58Apxw
 +4GertMVbxYFsEUV9Gs15YEUEGQiac846V1DU3PM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.243.72.216]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Ljrdd-1hpyPg2TCz-00bs3n; Sun, 03
 Nov 2019 13:31:37 +0100
To: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Vaibhav Jain <vaibhav@linux.ibm.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: =?UTF-8?Q?=5bPATCH=5d_powerpc/papr=5fscm=3a_Delete_unnecessary_assi?=
 =?UTF-8?Q?gnment_for_the_field_=e2=80=9cowner=e2=80=9d?=
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <389022fc-71b0-7952-3404-1da136dbdfd9@web.de>
Date: Sun, 3 Nov 2019 13:31:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TyXkMJhJt2mjD37pIwKvEn2qwm2H7VRI+BJefISVZ6piVGVXM5v
 CmKZQMb2hks/JwPQygp9zzlxMCFvJlmj/Cpcp4wy5aGOKncLkFJCrNWHBgE2cOf5oYRiSs5
 foUry41e2BGV9yidaolQIh29OPF+fWyYLbHU1RmjmxXYLfam/rybqt+Vg4bdFBHg1uJW0/z
 ZLXBM0vS8KGUBpY6LXbEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BM2XRUCBW5k=:F5J2+pdkZFopixgl6h3M4z
 UXrCPC4Z8SNWBCP5SUHjXrP/t9Tev/IVbBRZ1OUY/4M9kKHk+qH09J/9Bsl36GYGVakzdUM3k
 Yam9A4WTL+X0Pub6E6wccpY+op2tIZ/G8VLF2eyoGUQEi161GBbY/BfAvr1wsdc7kJ7um2EmU
 k6Zmokdaz/Q5mFeIr33YduOx23R+xiy/cvwdcLV8v97vDrn3HbKQHc4pCkUQaNWNqnmxlpMgt
 gkdVaUb0GKxruhXcnTKqPUEef2NiXCKo8BnxtdZV6TyIR4NiBaB9QD0tNRisooPX59c9ujNJt
 /TpF1Js7HHB2SaUWJfe3wl6D71FsCS2IHvOmMqFl0TYYABIeIDSn6qDtnhAU/CdFu4RRTRu5P
 yIAxqStyt9h4EZHcp7bxcisg+B1STAB+6qfrtEtR+epydEOJDWgEY3o2o/tFJeCCVFi/0StIJ
 Wd+wdPW5SvJZVSFJUKf4cDye0LZSQFu/kYJphDpcZ/OqqnSNpcbzpCl/NQhIHi6CzDsPh7q+l
 Kmw7Y6iGS4V2fHVzMo/jwI4PWNzuYBbAIhlnCOKtx1mgVFMviP+38+zMe+UNISPE25sxBViwv
 VfENcVOYul15f/BHCXGcYbsb5hTvnBmoByVCSPC0jQ6C8tn1NOUjkxQXUxtY8QUcPRW2UMcED
 nQVQdIhBJSpUT+Y20NiIfkZ4pN6CUkVByOvbTsDzfLB0BQOJwkVgAqDSY/8b2LoMkRJN+qbIe
 HregoiEExdLh/ZshLpjdD0wIiWolWx87YSH0L82HfTJUXXKPDQQDDrUMRE0gZNz1BZXAhXK2Q
 sPa8DSIqVnG1t+UNjbup9pJX1uEDyl4MqYmhML5kIOPuN0ZuOOUz1fz5Yf1aAyVp761We98cm
 V3ZqvQBhTLfLSbUIbRrU/ibyXKD2t8auTmyK9hloix1MgNpZZxlxCJyZ78XFMDzXcP+tBXkHB
 IHRkhYCUQoQf/Q5+/GfIO3NXJVgRm7P/nLY3KVEFpjL1PlxJsdQxQr50U8pfIdB85ddzuSzv5
 Zfm4wIMSHmU4C7BgvIn98JgNrkUST3j7dmXucK3cJtU58arS6oFuu9D+mSrgN43bauqjUtv5k
 D6O5AGCyOJgOX6/JLOs7X0P0S6PyWBMr2n/CKZM0UeoclnyjbbHA1pzwBc/7sPN8oNW0IpTwZ
 5AhsIrFBEG+4xQe1wuIdbTrMz7pR6MHF3wZuUR0GDtzwpEpO/VHFxNLTEKETiSy6JdP6x0oMz
 7khi+AG0Yq6EzowOUeNzLAUVy316+hqlZH9J2Sp/WXG+nzGiqtqxYQ0o9j0g=
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
Date: Sun, 3 Nov 2019 13:23:13 +0100

The field =E2=80=9Cowner=E2=80=9D is set by the core.
Thus delete an unneeded initialisation.

Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/pseries/papr_scm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/plat=
forms/pseries/papr_scm.c
index ee07d0718bf1..f87b474d25a7 100644
=2D-- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -513,7 +513,6 @@ static struct platform_driver papr_scm_driver =3D {
 	.remove =3D papr_scm_remove,
 	.driver =3D {
 		.name =3D "papr_scm",
-		.owner =3D THIS_MODULE,
 		.of_match_table =3D papr_scm_match,
 	},
 };
=2D-
2.23.0

