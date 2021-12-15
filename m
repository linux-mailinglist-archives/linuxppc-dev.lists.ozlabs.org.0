Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6213475316
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 07:46:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDQkN3dxqz3cQJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 17:46:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::622;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on0622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDQjs5yFWz303F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 17:45:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUHeP1gEvZEgjrlh5EUkLoSwaiHBdnjn8wIziQWxy7mNsFpFDaGxvGYYf0E/kmO3GOobur3GXC/aZ+7UIKSimiAwXc19fQ9jhoDJye/U33/J87GC19gGzzxOHAHleECnfI2jknXVrodVFkgG5xmqA2Mg6bxAGcxwQsqyPB9WArtb3BU4yYlO+uiaqnssr6q6m3lOED7z6iQvV4GIbhQP0eD750tEls1olsb/xmEHkCTXv+/NrxgSeHbpETQgozP9bTW1YDxciTr/hmO+IgdRExZwi331MU6+qxqi9pPGA8WvQgB05B/z9flCrtBozq8umqpF2H/vZPXbchgc06Yx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CecWjS/2UZ0IgcjyZ1BNFW6PGMsjPsk8NnvtJJ1/fvs=;
 b=YBu/rNZbVR5tsc/OSVit3IKOiXeebF/e/ouhfG4ijHsF46Aza5Tk8L+m7wLxr4LHNUJg6texK6uyQ3Gd7NA7eDcmt+NFx+Rz7gVtISNUK/OUcLdgCz8GGWgBIbC6mDZV3M2v73IdL8RZKuM9tRDSHZL2w+Yj7YH73izqtdDaGkRIL7aIPN2poKn72RnArcYg2tA5hJ2APEpBkxlWIZpIS8DhFW9A2d7EUz+9V2RnPSFjWVwWFAkvarckJhrexsLcM7OFw2g64PEFf4pz5YCLpPwUjn89syTs/qJ1QPt1NSXR/cRc2MXKpMLQ+ZJrj25A0m3nPOdou8OAZ6T6X3Z28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 06:45:11 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::fc67:d895:7965:663f%2]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 06:45:11 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, "alex@ghiti.fr"
 <alex@ghiti.fr>
Subject: [PATCH v5 01/11] mm: Allow arch specific arch_randomize_brk() with
 CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Thread-Topic: [PATCH v5 01/11] mm: Allow arch specific arch_randomize_brk()
 with CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
Thread-Index: AQHX8X9O5i5ZFBctQkOLkg7QNFqn7g==
Date: Wed, 15 Dec 2021 06:45:11 +0000
Message-ID: <961336afce7a10ecc4e68021246772ee239dbc84.1639550392.git.christophe.leroy@csgroup.eu>
References: <cover.1639550392.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1639550392.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9802936d-ce33-4d4e-9e80-08d9bf967153
x-ms-traffictypediagnostic: MR1P264MB2147:EE_
x-microsoft-antispam-prvs: <MR1P264MB21479618DD2C1497C76C26ACED769@MR1P264MB2147.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vgZMCLDyaBr5fAUJrqG7mHoFcsTqwsG69NZeV7AgWsafI1eneMg3TtQEd7Sje1YJtP8euJKncXHGpz1PTgpTl8vebx5j4O7XmChijr1SpTpXbad6oYDkN/1rRaMuFHjiy2ieghKn7wRspU7JXFwNGE1NBBBy1dI8+XSS0GLYRapEvtqGBDn3NoC/xW+FQpxPc2UGATyqNY5bZSfObaALXmxwAOzT/7DNC2hpytLbKcuTQubvJy25WPsf2OVtAfEAXJJBb3utxsnnk2/GyH/A5050K8jwdtseSSCQGwzykEVV6Dd3SM20GpotV/t7UKvOZM+/x09ltd4sd1FmRHqAHNJM0QfeMlU7EemYYsQFPNzlr16CQzHJQCGQrkAqtMz052hnVODvBXPd+gkvUI9pXjfNAZE+YB84hlHF0URcKtMNwQ2cdZ2ph9eYzlxrSfaKC7j6r+smr0oRzTyytqrWlSyyLyPLcOTk0mROV3//StebX6uH9UUbMmj3pf6qixq/CIymZfE/v/kxE8qayxD1r/Z0Y4ijTVUSuXjVqLBt7B3hXv0fwiIQQaaKqRpCcRdf1NjD++UtVm/4Rqp0j/F39+QYGzVJjcnrCiwPL+BJuP7BE7FpQjlAZeJPlI5FqgXqv3DoRs6e02AIB7FlHVs+yt9ry/dmmEfQXEmu0BH1S3OneTQgosDpmR+OBbiCh5YD6jJ2Jwc/zzfmWo32xKNmpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(36756003)(6486002)(2906002)(86362001)(5660300002)(508600001)(26005)(186003)(38100700002)(8936002)(44832011)(54906003)(316002)(66556008)(66446008)(66476007)(64756008)(6506007)(76116006)(91956017)(8676002)(66946007)(4326008)(2616005)(4744005)(122000001)(83380400001)(6512007)(71200400001)(38070700005)(7416002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?oR2v3J4xwyotNZVkC5299RpizXG6DXXGn5dY0nBZwaUfG8P5kMEWT04mzc?=
 =?iso-8859-1?Q?f/9/Tj427PTS6ig07zUM1mG83ScaBYCj6MBKNfiZ/kRz2DLNw6QbX/qWd1?=
 =?iso-8859-1?Q?AqKs2exPx/1+Mv49Siz6PLKCC7D6isOCX7L0OB5P51dwtyOMc1QCZbgxUE?=
 =?iso-8859-1?Q?kzNRbsstqtRpSfS4NUBpHtsHmcHQh9Dun8/Cg+tPd1FxYEetgpiFiC0lMI?=
 =?iso-8859-1?Q?NUA7hBhjHmb5Yt86XPJOiclNK++F3yauwHERQumadHjFFSMz3gMn5VHh8L?=
 =?iso-8859-1?Q?0+klMZK4ZgIhSIIu6FF8noY4RJh4ukU3QElQY+Nx6V0J9rOh1qNA5PcH6n?=
 =?iso-8859-1?Q?s0j3AT9zTQPCD/YpJdHNT8FgxZehJY13E8I/f3MiQ33XIKuYxw29eRxlJ9?=
 =?iso-8859-1?Q?H7ELVyTwGC3ZpE0EsPx/CY5m8mKM1TJF6gbMzg0KRvmfVhMDWa1CULffVJ?=
 =?iso-8859-1?Q?moprhia+Vfo+VWfaK0/6TozA23A7qYBp8O5pPR5AybFitwH4v++x2TLlok?=
 =?iso-8859-1?Q?oSURyySVxr3fvo5ZIH3VU67E4MiRKpfbAB6zGerUBOoldyRW7fbvYLM5Dg?=
 =?iso-8859-1?Q?ipJ8S4qbzKlMBLoWKcoTtH0PgZeMnPShsWLRQWDc30Ri1Ics9dbwAFvJKw?=
 =?iso-8859-1?Q?YvbuMkVv1Nanfncm/4b9TOsDRAO875x4v3/YJZgh0qgxi1xodWuj27Ur34?=
 =?iso-8859-1?Q?ud7CWJU6lHt+vA6b4a6iYExkytMBoF7kzW85Krjw9ehmcEnkQA8oUUbEzM?=
 =?iso-8859-1?Q?emn3FN+hamsvrFtaxdQD4SrFjxJLFqLei3K3mt/e5smpCcl8MLSYLFiDxH?=
 =?iso-8859-1?Q?x8lKHexgMV7LkmDkogpIJDP2aWD9Ct0P5It+rif8DFwJsB/epy02CBsF3l?=
 =?iso-8859-1?Q?ATzw0iydZyNEDmbVb0SNseUx+3EOGQP3bn4IFAzv3v9jnGvdEZzytC1xKK?=
 =?iso-8859-1?Q?2xT18D1CkV97fBxUt5p7oQGq1Uq71lSGaZUipTrY4zrf4hpiqKsEmqhMd4?=
 =?iso-8859-1?Q?UzmokxENVr9mmlyrnOyqIrSVmvAkDGFADHEnvGzUj9ADCShSySsce9G7m2?=
 =?iso-8859-1?Q?+PFbCs2Tq9F9KhiXmm016H6oyqjetUP80pYyiieh54AcxFEN2nwdMEGaZ0?=
 =?iso-8859-1?Q?izd17E7+s0oFn6vYdXr4+uP/mcBTxOXbtQuaAogdc09zEucWZGk9SdaCP3?=
 =?iso-8859-1?Q?3j3mhVQ194+STxFA++wLc4yf2Mr0d6BWG5BEMWhd/dK0lUiPVGkMOaYf3D?=
 =?iso-8859-1?Q?WqknS7QO7h/iszB1rIVqRAgnTi+x9VAF5R22GcnaoelivWXBC9gZiZEXjk?=
 =?iso-8859-1?Q?zD92uvdkhHb7Ta2oApAgr9q8Evx7b1Ewg7eUTjF4SkF24/lZri8xOZEfHX?=
 =?iso-8859-1?Q?IxidAWIiukFJvAhTa9hrDa5i50EIDvDWEgyShhQd2HK/ivOlTbjUXpNLh6?=
 =?iso-8859-1?Q?ahNjJWCUbF1CSDUc+mMSbYjHLW5a0dOCChU+7oSrmIQ5FnAQtqKILYPb3z?=
 =?iso-8859-1?Q?UmMbxkrVL0c7aPbmIWtEyvo5k4cQa6aSCptwrcdCMThiorXdrJFELzOVeh?=
 =?iso-8859-1?Q?zUhbB79rQQ5j/tHtXN/9OuF1MEYSDNrGqaUeHMiF01UA3vv9cjWsN4kGdm?=
 =?iso-8859-1?Q?m+HVeTBw3oSateGk8CFeMj1eMI1Fjt9eUEn1+u/231pTDXYZuq02hiG6BK?=
 =?iso-8859-1?Q?xLF8blcaJN2keyRJN4qbBVZnuAFIzihuyHZSadM0sdzlOyWqmYAo6hE3oe?=
 =?iso-8859-1?Q?eu5njX3FP4sGqmJY7+4ICuGuA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9802936d-ce33-4d4e-9e80-08d9bf967153
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:45:11.2739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ntzYLw0v9+dVumhMfq5NO7Yf2/Bz7N8g++LaODTIdgpVsGOsB3O+sZ9XdoqRtbeZAPY4tcRzYp5pEsrxOkc2kJgWTQg80q7QrJuaCW70lb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2147
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
Cc: "will@kernel.org" <will@kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit e7142bf5d231 ("arm64, mm: make randomization selected by
generic topdown mmap layout") introduced a default version of
arch_randomize_brk() provided when
CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT is selected.

powerpc could select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
but needs to provide its own arch_randomize_brk().

In order to allow that, define generic version of arch_randomize_brk()
as a __weak symbol.

Cc: Alexandre Ghiti <alex@ghiti.fr>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 mm/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/util.c b/mm/util.c
index 741ba32a43ac..46d1a2dd7a32 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -344,7 +344,7 @@ unsigned long randomize_stack_top(unsigned long stack_t=
op)
 }
=20
 #ifdef CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
-unsigned long arch_randomize_brk(struct mm_struct *mm)
+unsigned long __weak arch_randomize_brk(struct mm_struct *mm)
 {
 	/* Is the current task 32bit ? */
 	if (!IS_ENABLED(CONFIG_64BIT) || is_compat_task())
--=20
2.33.1
