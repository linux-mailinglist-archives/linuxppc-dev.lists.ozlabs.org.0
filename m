Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195904A3E20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 08:18:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnKDK6Hj9z3bb5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 18:18:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::625;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::625])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnKCs0ml7z2xs7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 18:18:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQdDAbkRbcQtUChbdtriUZfD15FnuH4Thx5jQwg6Md1PmaSzyqHhgvgzMRoJ7DhycYThMO8PBbw0ojh/3ug8LSt6CrdjzFPpbYhVMh6gmsrOS0Zg79pwSvZghnnrPl+wM9RbBIpfNHc46DpGegPtQdLt6j+6Es7F4ZuflvvMrFUV8wyLhVEOEBjo+R1TsHg1uT/eT2tHLvY7AYUnAtqUUyLtVa+bTEoJ+5UC2vWywMesqnC78yDw0tY8vvo5pz0npScbjKiFSavHOOxTf8ZfKyLQrX0hS4f2+j5Q7hsZSBcOTklBuOHD5eho1ORV6EBmRJ6TPqNByaGTCYWvetfCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJG3DgFv/NDxpD8CaNquM9Ea9I89hzj51sPkoqNM/IU=;
 b=k0f6bdqDqWyOM8wFxur1KPXEFog0XelKIj12sDO2wudONAY4Nut++fcY9URVfQi3ZXZeEJwFZMxjqFxALfbQWQ9ODWH/OaHY3M23tqnPZhyrInG8s2LcOFHm5Gx1LHxWe+yedDqm7OqEZrpaXXaJnDV5kCsbdGwg3oxDmGW38PAWmewx4FJKfz9pKx6upBIWFm8lHxQMPUiC1Hgthiyi2ILhDuuBPiwp0tEpYPAuWqwci15v9jgxcMtWT8oqidEg2ex7vUHMBKJrP7/q382DQ/TpN2R5C8grjf4ipeHKImfIGGzBdDTTJ30EWWQd/63KzAdFw72ek1fM3ahrZD3Vvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3220.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Mon, 31 Jan
 2022 07:17:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c9a2:1db0:5469:54e1%6]) with mapi id 15.20.4930.020; Mon, 31 Jan 2022
 07:17:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/603: Clear C bit when PTE is read only
Thread-Topic: [PATCH] powerpc/603: Clear C bit when PTE is read only
Thread-Index: AQHYFnKrmk31jqOgQkKbAto8DRD6Gg==
Date: Mon, 31 Jan 2022 07:17:57 +0000
Message-ID: <bbb13848ff0100a76ee9ea95118058c30ae95f2c.1643613343.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e3e7d6b-3064-4e12-cda0-08d9e489ce50
x-ms-traffictypediagnostic: MR1P264MB3220:EE_
x-microsoft-antispam-prvs: <MR1P264MB3220E170C602944731045CAAED259@MR1P264MB3220.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:212;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oFnEzmvksO6MFFsGuHN4B23EpqRfJDt4DDN/6vYfShtG/sHUe77sQON4ATM41WGaUhCa7fGlnOufusB3YQ3GgLNQBraa86nMajA0+k5X48ujAFhYtfuXnSawOI3CSv2MBgUzvWrYMBXEuFW0se2iutSs0Me1RWI+vAOPy/nhX6UApkUVsuSenxTah0FBxKozrpfUbA1o0KsAV7C02NRsrqcnc8iKgSnOL5dXLdD3W2XizaGPvr6TTv/KuJ2ozt0HwPRgDk13sgkhfDu4Te91MW2Ms4NXfdM7HHycXxMB8+VZj1SfZIXwZp3JtGSVQ5dGs31dC4/6g+G/C3IU/R5kx346kbG5BfoK6Sz0bKIsb+sZIP+2dkA7Ia1DQ7ufaMqJNONFaYEaQw0z2wuwh3SuAlSeuiHAWSzWePVF47XqyG8kmS2K5nByHNgjbGOroghndVwh1KHu4Y4S6KZzGE7ScYdozEEF2VytNm2TW5slYEChtWP/pNvrWPvhK3Dp2YqVJ9XnSqwraWnqWlX6yUgFTUvENhyaAaSzgstJ6xUhvkJpjoUTE35YBKYAjf8ON8yanrVbh1ENoojbH6SeMa21Q+L4BlnyNd9tJgowkK4SifRQrMPPSX01kdB1Hh3m3GcnLoDawP8k2bXjw8UdaNzFUvLrcs+T4+PKXXf8ZCAL5qwnW4N++O0w4ya+GqwuRpi6B5mk9/9ZZFfiHMpYDo0dFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(110136005)(54906003)(6486002)(316002)(122000001)(5660300002)(86362001)(44832011)(91956017)(38100700002)(2616005)(66946007)(76116006)(64756008)(66556008)(66476007)(66446008)(8936002)(8676002)(4326008)(2906002)(508600001)(186003)(26005)(36756003)(6506007)(71200400001)(6512007)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?22+spF6mqYFOXx0tMmWF+D3avWicWxu+uhqKh9rmfZEaMBICWaWYrc08xH?=
 =?iso-8859-1?Q?qH4igFzzlOQYhRDE++hcRRVVPf2OPZlN26gHK9FC6N4z6jJs/ipcd7DP2v?=
 =?iso-8859-1?Q?o0oQFJbXgy81dgcy3MzhjTpeK3cBI1PqFELqNjl4GuULsbYk4kIWwV1oDc?=
 =?iso-8859-1?Q?PhtGU2mAfYdE8htnb7tze5gnPZ0S5WbyA9Cx0mynKGraO4T1j9EKeZWxNR?=
 =?iso-8859-1?Q?85BVdRK3l3bIPpe6sdS+VQit0s4PyVr1RPbHsAXwqUlfJLenYucvHKmsL5?=
 =?iso-8859-1?Q?rXcux1Zfr4yQf5t5iC/16OVXdGFoCL8WpEVHbxvXuXfTn/irhG7AdvMsJr?=
 =?iso-8859-1?Q?B63QDGpeLO3yyT8KPFwuppujEGpldCMffNQ16bNAqvQ9XyiVDv+HiGmKHC?=
 =?iso-8859-1?Q?TQ0C8fGxtu6jBy0b5yHtHU6d26FYgETuPkJna4cc6DGKbcoIqDUE882bFD?=
 =?iso-8859-1?Q?nF5DY9hbucoJ3zY4PIJr6j3IZKn319oA0/73PPZurw+jvGveCYexlHdA2r?=
 =?iso-8859-1?Q?+ASuClx+ZD3UBH6OEbDwTVL9VXEOnvMjIY3D5nwrXl+1e/8kPjcv8xqCbf?=
 =?iso-8859-1?Q?FV9KfHnhtxdXT8pM/fZeYNypS3adBypzH2b7kEqM3Q0+y6YJhC3PiPG96V?=
 =?iso-8859-1?Q?D0VZj2zIzxfe3/goV7gPMJhnyrUCfKmNBpFP9LgyN7GKUJAIFMgRtVXzGZ?=
 =?iso-8859-1?Q?4V/9hg7oWJuYy6YXVFFTfu9ie0+FDq9WWgaPsHfu9OEXOug+kmYfU88PAk?=
 =?iso-8859-1?Q?KD9jP2dhnpwnip8rAumgFYHL4192Qj+X4k9Ile7oG/PKGy9ceGL3jtfMqF?=
 =?iso-8859-1?Q?/Jms5ucH4wNzT2qDjnOBMTf2XCpzeYAf3XMHfnoJXIBjGu/kA5HqV9x7GJ?=
 =?iso-8859-1?Q?vuirA1i3f7n3bE9DU86By9mQBpu52x9XN0fyFnxOisak6xVj17DUvfHhvA?=
 =?iso-8859-1?Q?nA7srnMivGLTXDqE3ENL/Jj+Dl/ZWnxlzBrzK0bZBvPGA9DBNOvknfjRp7?=
 =?iso-8859-1?Q?hfDlji7Rd3nlZSZ15bU8WGCCrDfiG3VjQe0Ne7nhpIVJmOrwHt8OkLdlip?=
 =?iso-8859-1?Q?3WQo2i29t7WtlsbLTT/j+oMIfQ1hu6oso4RTNzYyzsGy96hZKTqXT/oE2a?=
 =?iso-8859-1?Q?h+y51ekN5oaS40NMNe7ORXdTq3oTwSA8Tr7XrKcS9QtbgdwU/eZAAk0pPS?=
 =?iso-8859-1?Q?Uu48uC1P44vXSyhdb8eitB+51SHaVFDpMq/mPUuxbz93DaLB9YJmLs2Yju?=
 =?iso-8859-1?Q?y9NRzom0myYPabZ6W/1m00Jh/X60Se6BJA3C1rS4dB7sqku1kNa6y5X8pK?=
 =?iso-8859-1?Q?CzSEZZl/8n81rTuqc4ngyB0wkELhqEryuzjzfi9X+xYsyGpbgu13LOrafO?=
 =?iso-8859-1?Q?YnFOD2RepEU8Q4o5S4JkfiyRggPQabJ+6885Tg2jA/Sr1YqwmqjU/kwtAr?=
 =?iso-8859-1?Q?WTodRWWhxMx/5xs/rhkJ5VB/O44QzKLEYCJswr8Cpze+8WM4hwVmMaPe8k?=
 =?iso-8859-1?Q?+wVbDsE8rBOr7YBeUNry3wNjhiUifsgSjwXiqJG4grAaSdEqeLklDhfPZv?=
 =?iso-8859-1?Q?aDiv82a54SIoOk/FDerqDCTNAnSl8e/SVrvco41rcYLiLGKpRc8woGR01u?=
 =?iso-8859-1?Q?g9Cssmy3d1q5k0TsY7tyMyrJKe602BBzBjhb8yy+IXQ8IdSKOPInLid/Iw?=
 =?iso-8859-1?Q?4VuSWd4PGeQjtjOF5EwIBy8ROU9sO+gIJsIdNGRdX0lTNfQ5o/7c2+RTr1?=
 =?iso-8859-1?Q?H2d70RNcCqUoXppdS+Qo0+9fM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3e7d6b-3064-4e12-cda0-08d9e489ce50
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 07:17:57.2221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9MznOOP2C12ZocoGTwPxF7GtVHpexHTT7LJowerjlkFKtVsHASS64xQVCER0Gn50JfyZWmyj7ZxQyRWA2M/Km+BccRVJbtn1gb+a8OpRDYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3220
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On book3s/32 MMU, PP bits don't offer kernel RO protection,
kernel pages are always RW.

However, on the 603 a page fault is always generated when the
C bit (change bit =3D dirty bit) is not set.

Enforce kernel RO protection by clearing C bit in TLB miss
handler when the page doesn't have _PAGE_RW flag.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/hea=
d_book3s_32.S
index 7f4f3a52b730..6c739beb938c 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -504,7 +504,9 @@ DataLoadTLBMiss:
 	/* Convert linux-style PTE to low word of PPC-style PTE */
 	rlwinm	r1,r0,32-9,30,30	/* _PAGE_RW -> PP msb */
 	rlwimi	r0,r0,32-1,30,30	/* _PAGE_USER -> PP msb */
+	rlwimi	r1,r0,32-3,24,24	/* _PAGE_RW -> _PAGE_DIRTY */
 	rlwimi	r0,r0,32-1,31,31	/* _PAGE_USER -> PP lsb */
+	xori	r1,r1,_PAGE_DIRTY	/* clear dirty when not rw */
 	ori	r1,r1,0xe04		/* clear out reserved bits */
 	andc	r1,r0,r1		/* PP =3D user? rw? 1: 3: 0 */
 BEGIN_FTR_SECTION
--=20
2.33.1
