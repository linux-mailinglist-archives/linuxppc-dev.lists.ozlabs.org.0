Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F898718E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 07:36:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464YrN2F3hzDqLK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2019 15:36:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=bugzilla.kernel.org
 (client-ip=198.145.29.98; helo=mail.wl.linuxfoundation.org;
 envelope-from=bugzilla-daemon@bugzilla.kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=bugzilla.kernel.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464YpL6bKszDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 15:34:33 +1000 (AEST)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 2F99E28C2E
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2019 05:34:31 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 2271328C30; Fri,  9 Aug 2019 05:34:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Subject: [Bug 204479] KASAN hit at modprobe zram
Date: Fri, 09 Aug 2019 05:34:29 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Flash/Memory Technology Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christophe.leroy@c-s.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: dwmw2@infradead.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204479-206035-jkN2KbkBrX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204479-206035@https.bugzilla.kernel.org/>
References: <bug-204479-206035@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D204479

--- Comment #8 from Christophe Leroy (christophe.leroy@c-s.fr) ---
List of allocated areas with associated kasan shadow area in [ ], together =
with
the addresses when shadow initialisation fails:

Aug 08 23:39:58 T600 kernel: ###### module_alloc(c78c) =3D f1470000
[fe28e000-fe28f8f1]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(36f8) =3D f147e000
[fe28fc00-fe2902df]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(c78c) =3D f1483000
[fe290600-fe291ef1]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(c78c) =3D f1491000
[fe292200-fe293af1]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(36f8) =3D f1502000
[fe2a0400-fe2a0adf]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(1521) =3D f1013000
[fe202600-fe2028a4]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(13bc5) =3D f103d000
[fe207a00-fe20a178]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(1357) =3D f1027000
[fe204e00-fe20506a]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(36f8) =3D f102a000
[fe205400-fe205adf]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(4301) =3D f102f000
[fe205e00-fe206660]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(4718) =3D f1065000
[fe20ca00-fe20d2e3]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(19ac) =3D f1076000
[fe20ec00-fe20ef35]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(4718) =3D f129d000
[fe253a00-fe2542e3]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(16ca) =3D f102a000
[fe205400-fe2056d9]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(1f81) =3D f1079000
[fe20f200-fe20f5f0]
Aug 08 23:39:58 T600 kernel: ###### module_alloc(1f81) =3D f1027000
[fe204e00-fe2051f0]
Aug 08 23:39:59 T600 kernel: BUG: Unable to handle kernel data access at
0xfe20d040
Aug 08 23:39:59 T600 kernel: ###### module_alloc(185ef) =3D f12d0000
[fe25a000-fe25d0bd]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(4035) =3D f106b000
[fe20d600-fe20de06]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(6196) =3D f12b3000
[fe256600-fe257232]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(1d27) =3D f1071000
[fe20e200-fe20e5a4]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(4035) =3D f102d000
[fe205a00-fe206206]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(a11b) =3D f13ad000
[fe275a00-fe276e23]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(4035) =3D f12b3000
[fe256600-fe256e06]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(4035) =3D f12ea000
[fe25d400-fe25dc06]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(1d27) =3D f1033000
[fe206600-fe2069a4]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(4035) =3D f1397000
[fe272e00-fe273606]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(307a) =3D f12f0000
[fe25e000-fe25e60f]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(1d27) =3D f1062000
[fe20c400-fe20c7a4]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(1d27) =3D f12f7000
[fe25ee00-fe25f1a4]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(1d27) =3D f12fd000
[fe25fa00-fe25fda4]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(d102) =3D f1429000
[fe285200-fe286c20]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(2a37) =3D f1033000
[fe206600-fe206b46]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(4718) =3D f106b000
[fe20d600-fe20dee3]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(9a3f2) =3D f1db8000
[fe3b7000-fe3ca47e]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(18571) =3D f13cd000
[fe279a00-fe27caae]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(1f81) =3D f1071000
[fe20e200-fe20e5f0]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(1fdb9) =3D f1438000
[fe287000-fe28afb7]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(56a49) =3D f1e54000
[fe3ca800-fe3d5549]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(56a49) =3D f1eac000
[fe3d5800-fe3e0549]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(56a49) =3D f1f04000
[fe3e0800-fe3eb549]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(7c61) =3D f12ea000
[fe25d400-fe25e38c]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(e011) =3D f140c000
[fe281800-fe283402]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(56a49) =3D f1f5c000
[fe3eb800-fe3f6549]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(56a49) =3D f1fb4000
[fe3f6800-fe401549]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(e011) =3D f1459000
[fe28b200-fe28ce02]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(e011) =3D f147e000
[fe28fc00-fe291802]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(2561) =3D f1033000
[fe206600-fe206aac]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(6ae1) =3D f12b3000
[fe256600-fe25735c]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(e011) =3D f148e000
[fe291c00-fe293802]
Aug 08 23:39:59 T600 kernel: ###### module_alloc(e011) =3D f200c000
[fe401800-fe403402]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(3355) =3D f1397000
[fe272e00-fe27346a]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(1c8f) =3D f12f7000
[fe25ee00-fe25f191]
Aug 08 23:40:00 T600 kernel: BUG: Unable to handle kernel data access at
0xfe2731a0
Aug 08 23:40:00 T600 kernel: ###### module_alloc(1c078) =3D f13cd000
[fe279a00-fe27d20f]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(12f27) =3D f13eb000
[fe27d600-fe27fbe4]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(12f27) =3D f13ff000
[fe27fe00-fe2823e4]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(12f27) =3D f1413000
[fe282600-fe284be4]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(12f27) =3D f1459000
[fe28b200-fe28d7e4]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(601c) =3D f12b3000
[fe256600-fe257203]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(3716) =3D f147e000
[fe28fc00-fe2902e2]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(3716) =3D f1483000
[fe290600-fe290ce2]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(3716) =3D f1488000
[fe291000-fe2916e2]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(3716) =3D f148d000
[fe291a00-fe2920e2]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(12f27) =3D f1647000
[fe2c8e00-fe2cb3e4]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(1b7a) =3D f1033000
[fe206600-fe20696f]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(3716) =3D f165b000
[fe2cb600-fe2cbce2]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(15f7) =3D f12fd000
[fe25fa00-fe25fcbe]
Aug 08 23:40:00 T600 kernel: ###### module_alloc(fe69) =3D f13ff000
[fe27fe00-fe281dcd]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(fe69) =3D f1410000
[fe282000-fe283fcd]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(fe69) =3D f1459000
[fe28b200-fe28d1cd]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(fe69) =3D f147e000
[fe28fc00-fe291bcd]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(3087) =3D f12b3000
[fe256600-fe256c10]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(3087) =3D f1421000
[fe284200-fe284810]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(3087) =3D f146a000
[fe28d400-fe28da10]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(2d72) =3D f1592000
[fe2b2400-fe2b29ae]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(1c09) =3D f12b8000
[fe257000-fe257381]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(1e4d) =3D f12fd000
[fe25fa00-fe25fdc9]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(3087) =3D f1596000
[fe2b2c00-fe2b3210]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(1562) =3D f1426000
[fe284c00-fe284eac]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(2d72) =3D f15ab000
[fe2b5600-fe2b5bae]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(24c2) =3D f15bc000
[fe2b7800-fe2b7c98]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(2d72) =3D f12b3000
[fe256600-fe256bae]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(2d72) =3D f1420000
[fe284000-fe2845ae]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(1c09) =3D f1424000
[fe284800-fe284b81]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(15b9) =3D f1469000
[fe28d200-fe28d4b7]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(1c09) =3D f146c000
[fe28d800-fe28db81]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(1c09) =3D f147e000
[fe28fc00-fe28ff81]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(2d72) =3D f1491000
[fe292200-fe2927ae]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(1c09) =3D f1495000
[fe292a00-fe292d81]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(2068) =3D f1498000
[fe293000-fe29340d]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(13c0) =3D f1469000
[fe28d200-fe28d478]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(3f159) =3D f149c000
[fe293800-fe29b62b]
Aug 08 23:40:01 T600 kernel: ###### module_alloc(d8e5) =3D f14dd000
[fe29ba00-fe29d51c]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(4ed5) =3D f1500000
[fe2a0000-fe2a09da]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(2843) =3D f12b3000
[fe256600-fe256b08]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(2843) =3D f12b7000
[fe256e00-fe257308]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(2843) =3D f141e000
[fe283c00-fe284108]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(2584) =3D f1422000
[fe284400-fe2848b0]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(1be5) =3D f1426000
[fe284c00-fe284f7c]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(1be5) =3D f1467000
[fe28ce00-fe28d17c]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(2843) =3D f146a000
[fe28d400-fe28d908]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(1be5) =3D f147e000
[fe28fc00-fe28ff7c]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(1be5) =3D f1491000
[fe292200-fe29257c]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(3921) =3D f1523000
[fe2a4600-fe2a4d24]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(199d) =3D f1410000
[fe282000-fe282333]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(9d3b) =3D f1412000
[fe282400-fe2837a7]
Aug 08 23:40:02 T600 kernel: ###### module_alloc(2bfc) =3D f1422000
[fe284400-fe28497f]
Aug 08 23:40:03 T600 kernel: ###### module_alloc(19a6) =3D f1422000
[fe284400-fe284734]
Aug 08 23:40:03 T600 kernel: ###### module_alloc(5215) =3D f1514000
[fe2a2800-fe2a3242]
Aug 08 23:40:03 T600 kernel: ###### module_alloc(1524) =3D f148b000
[fe291600-fe2918a4]
Aug 08 23:40:03 T600 kernel: ###### module_alloc(1d62) =3D f148e000
[fe291c00-fe291fac]
Aug 08 23:40:03 T600 kernel: ###### module_alloc(bf4f) =3D f1596000
[fe2b2c00-fe2b43e9]
Aug 08 23:40:03 T600 kernel: ###### module_alloc(19bf4) =3D f15f7000
[fe2bee00-fe2c217e]
Aug 08 23:40:03 T600 kernel: ###### module_alloc(2851) =3D f1481000
[fe290200-fe29070a]
Aug 08 23:40:03 T600 kernel: ###### module_alloc(52fd) =3D f1485000
[fe290a00-fe29145f]
Aug 08 23:40:04 T600 kernel: BUG: Unable to handle kernel data access at
0xfe2b40dc
Aug 08 23:40:04 T600 kernel: ###### module_alloc(f30b) =3D f14eb000
[fe29d600-fe29f461]
Aug 08 23:40:04 T600 kernel: ###### module_alloc(2d9d) =3D f1485000
[fe290a00-fe290fb3]
Aug 08 23:40:04 T600 kernel: BUG: Unable to handle kernel data access at
0xfe29f0b0
Aug 08 23:40:05 T600 kernel: ###### module_alloc(3f9d) =3D f1489000
[fe291200-fe2919f3]
Aug 08 23:40:05 T600 kernel: ###### module_alloc(1e82) =3D f148e000
[fe291c00-fe291fd0]
Aug 08 23:40:05 T600 kernel: ###### module_alloc(666f) =3D f151b000
[fe2a3600-fe2a42cd]
Aug 08 23:40:05 T600 kernel: ###### module_alloc(264d) =3D f14fc000
[fe29f800-fe29fcc9]
Aug 08 23:40:06 T600 kernel: ###### module_alloc(180d) =3D f12b3000
[fe256600-fe256901]
Aug 08 23:40:06 T600 kernel: ###### module_alloc(13fa) =3D f141d000
[fe283a00-fe283c7f]
Aug 08 23:40:06 T600 kernel: ###### module_alloc(74a8) =3D f1459000
[fe28b200-fe28c095]
Aug 08 23:40:06 T600 kernel: ###### module_alloc(2cc6) =3D f141d000
[fe283a00-fe283f98]
Aug 08 23:40:07 T600 kernel: ###### module_alloc(eeb18) =3D f19ee000
[fe33dc00-fe35b963]
Aug 08 23:40:07 T600 kernel: ###### module_alloc(2f546) =3D f1528000
[fe2a5000-fe2aaea8]
Aug 08 23:40:07 T600 kernel: ###### module_alloc(37fed) =3D f1559000
[fe2ab200-fe2b21fd]
Aug 08 23:40:07 T600 kernel: ###### module_alloc(37fed) =3D f1c94000
[fe392800-fe3997fd]
Aug 08 23:40:07 T600 kernel: ###### module_alloc(37fed) =3D f1ccd000
[fe399a00-fe3a09fd]
Aug 08 23:40:07 T600 kernel: ###### module_alloc(4fa5) =3D f1462000
[fe28c400-fe28cdf4]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(4fa5) =3D f1468000
[fe28d000-fe28d9f4]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(4fa5) =3D f148e000
[fe291c00-fe2925f4]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(37fed) =3D f1e54000
[fe3ca800-fe3d17fd]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(4fa5) =3D f14dd000
[fe29ba00-fe29c3f4]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(114e6) =3D f15a3000
[fe2b4600-fe2b689c]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(114e6) =3D f15c0000
[fe2b8000-fe2ba29c]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(114e6) =3D f15d3000
[fe2ba600-fe2bc89c]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(3afc) =3D f141d000
[fe283a00-fe28415f]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(3afc) =3D f1462000
[fe28c400-fe28cb5f]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(114e6) =3D f16de000
[fe2dbc00-fe2dde9c]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(3afc) =3D f1467000
[fe28ce00-fe28d55f]
Aug 08 23:40:08 T600 kernel: ###### module_alloc(3afc) =3D f148e000
[fe291c00-fe29235f]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(1bde) =3D f141d000
[fe283a00-fe283d7b]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(16f8) =3D f146d000
[fe28da00-fe28dcdf]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(1bde) =3D f147e000
[fe28fc00-fe28ff7b]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(1bde) =3D f148e000
[fe291c00-fe291f7b]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(1bde) =3D f1491000
[fe292200-fe29257b]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(16f8) =3D f14e8000
[fe29d000-fe29d2df]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(16f8) =3D f14fc000
[fe29f800-fe29fadf]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(16f8) =3D f1511000
[fe2a2200-fe2a24df]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(105dd6) =3D f1612000
[fe2c2400-fe2e2fba]
Aug 08 23:40:09 T600 kernel: ###### module_alloc(2b1fa) =3D f1719000
[fe2e3200-fe2e883f]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(35b8) =3D f1466000
[fe28cc00-fe28d2b7]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(2006) =3D f1554000
[fe2aa800-fe2aac00]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(2c633) =3D f1528000
[fe2a5000-fe2aa8c6]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(5c9d) =3D f14dd000
[fe29ba00-fe29c593]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(571d) =3D f14e4000
[fe29c800-fe29d2e3]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(571d) =3D f1506000
[fe2a0c00-fe2a16e3]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(571d) =3D f150d000
[fe2a1a00-fe2a24e3]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(22af) =3D f1462000
[fe28c400-fe28c855]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(22af) =3D f146b000
[fe28d600-fe28da55]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(2946) =3D f148e000
[fe291c00-fe292128]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(22af) =3D f14fc000
[fe29f800-fe29fc55]
Aug 08 23:40:10 T600 kernel: ###### module_alloc(18bc) =3D f147e000
[fe28fc00-fe28ff17]

--=20
You are receiving this mail because:
You are on the CC list for the bug.=
