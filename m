Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D30C189E59F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 00:24:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=L6MPOq73;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDgV84VlFz3vcc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 08:24:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=L6MPOq73;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260f::701; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=kshitiz.varshney@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:260f::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDNBn3JNRz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 20:54:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcJjeDE53z+aJ1bN5rK8YFJm/tKzvnI4M9z7UU8op/hg+RfBa0JEpk7DrWq82Lz8FqoTw6EeYCwmc/DH6w5wVCcnL87lYFXXKtx9oeWnXSgIpIFqViGjqBerbEeH8mYilkJZx+FMMlO2kDb6qwvWTsfiDwR6Nj9OjfrH7E2ATL/4PfQJj2XqaoJLTADtDYNd45riwfQnVaSvqW9X82RI6cCRicTYJJmPo2sZqYP5kWUfn6XoIQjJlCkTX5m0cD9I2dj4M7KDBtua07Ar7j56HAYPV72qPHmwgQXfNe0T+nVv8Q9Vqltzgfz7eStcq+cTM1Wnz45qJKSDHVaMunHqwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1OkZhRUlrJCI5ikV2kv17qmHEHI+sfWVAxK9Swq2pc=;
 b=oahpDHm+XTIWxgLZOsiY1ZwcD+ocO6+8HUqiUwyaCmuZJIKrwwLCFAYnB2dmNrYX4hpwWZOCHCqzSdpqOKZgll+it92tna9Ua3r3LxKsQQwzzgw4vBjvj/IfPD1nr6psDSKrVYUAN0sce4A/f0/MC17lPlcFxwDZC33fMgzOQXcZn4CrJphsOt4cPzMaR7dzg4106w6k3a7WQbDbCA0mOm0ThPXZjoQ2VMLvj+GKzX6dMC6HMWlgcxTzBdaFHHOVt4Bk2gA4xFOk+tN1QVeIwh1qgM0wwWNOTp/zc34is23sOTaoj5J9kF4TTG2dhMQGmHMHOq1NvDzRl7C+3UR0oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1OkZhRUlrJCI5ikV2kv17qmHEHI+sfWVAxK9Swq2pc=;
 b=L6MPOq73DM24HMMO+bn74iW3hgPAyu8t0frt71LEn5lP/Hp+RnAJEGFrcvaDum5Y9Mo7BUZjU4K//er4AcHhAk/G+xj/z8yCOUqSGN1R0SEGJL2VD2uqlfvxA+eWqH4vo4vuPrPVUuEHTfOEwbwsJsd0r4F7U3cml3ffYSDFFv4=
Received: from DB6PR04MB3190.eurprd04.prod.outlook.com (2603:10a6:6:5::31) by
 AM8PR04MB7729.eurprd04.prod.outlook.com (2603:10a6:20b:24c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 9 Apr
 2024 10:54:16 +0000
Received: from DB6PR04MB3190.eurprd04.prod.outlook.com
 ([fe80::e8bc:451:6316:4a6f]) by DB6PR04MB3190.eurprd04.prod.outlook.com
 ([fe80::e8bc:451:6316:4a6f%6]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 10:54:15 +0000
From: Kshitiz Varshney <kshitiz.varshney@nxp.com>
To: David Gstir <david@sigma-star.at>, Mimi Zohar <zohar@linux.ibm.com>, James
 Bottomley <jejb@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, Herbert
 Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Subject: RE: [EXT] [PATCH v8 3/6] KEYS: trusted: Introduce NXP DCP-backed
 trusted keys
Thread-Topic: [EXT] [PATCH v8 3/6] KEYS: trusted: Introduce NXP DCP-backed
 trusted keys
Thread-Index: AQHahZe8FOET2O8opkK/K3DU/sDkl7Ffx2mg
Date: Tue, 9 Apr 2024 10:54:15 +0000
Message-ID:  <DB6PR04MB31904A8EB8B481A530C90CBB8F072@DB6PR04MB3190.eurprd04.prod.outlook.com>
References: <20240403072131.54935-1-david@sigma-star.at>
 <20240403072131.54935-4-david@sigma-star.at>
In-Reply-To: <20240403072131.54935-4-david@sigma-star.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB6PR04MB3190:EE_|AM8PR04MB7729:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6/+Vn90fw532JFQk9K/SMegzAD0/T+EMA6S4mChio2VmmWYC1L68I12kBQoO6yv3BS3zdJQ639TVuTaywMtqLQ134H4GxNKoDUaemxwmqPf7xHrzvtzgmFITPzj/hpvssw8JDJS+8d8q+oo1l+YWnktcAYbrOfkI4V0/FJeourmFaiWn+amIyyLlvi9y+isGPCNK4DfyrhKFTwa+ZcArW/J2Ag7Wzq0iQAson7cmGe2yPUSigGUFJT+dmCHcWYXtPrdGm5WCBQ2jRE7q6Py42KbKXkwpsXoofgTu3hEICNwBmnPWHxYnr6DAXMcsUHWfovFL1Afshl8W3b9ZzCgTS77X/dd9/7gN7zphOsoxNUrJJWPo+qtXLhH7iMqYv9haBQGEDDSlsI0OA6BncqPaD7sLiZvfGelSqdIzCqt6HhkQjQolDH1VcMvfpgy1yQGnhjw82rI28MEvWFNvkEzLQI378q6/WAzjjGk9S6QoWOKn5g6vkBj2Cqx9JY3bA3X5Nsex4WMGPXC3mFYTiMElOL8FOtReR5TJjQtNZQJpV2M9NvmuFoBDiyrQXVZIyKEHqtYWAiiW2GrRJOGYKzTvljBLzGi1wfax19dc1xPIajGY05O3IdE8B4M+rJuBU9TPuHcZXQDvSjsbt2n1rt2gT8p8IAkYMf8ehMzcFhhynM8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR04MB3190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(7416005)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?yxDlHUfSGeqXDt7bACBi41HoXDms9MRKMtnj+PLOR97Mgj3C5D9IJfREc8KP?=
 =?us-ascii?Q?G+HNhn/hnLqrU2bv156Y3NcR5CjihWiYz+K7+kBzAfXWTAe2QI97T5p0Xe86?=
 =?us-ascii?Q?raIDXPyPBPzDShvzJAX4cS//CPgQGEyhuKL9HI6Mobq8ZsgQmB0SiJcYzo4L?=
 =?us-ascii?Q?ZrKxFk1kjP5fzOQVMLCLTjEGapmGQinuXK/cxd1nbVCdmIyVpVa5BRIQYazH?=
 =?us-ascii?Q?KwNHIlpRNf3IJGrG7XaMRzWwTXJvj1yKdEuXD22vrhtcM6ZHpM07IKX+xkOa?=
 =?us-ascii?Q?6dmzHSD8wqh+nWE3m14jt/WkbTj3AUk3lpahmb9Ny3yIVvzQzAhSfExIw0Ld?=
 =?us-ascii?Q?YbTPp1wz+a2nVB2rXcak1b4QN7B0rI9+yLR0NqD05DCPz+83t7cNPiLXCFTi?=
 =?us-ascii?Q?AufraiAEpzJq8AJAbYYPrUpTThVw/bC3oqPu0oqnYt2l/COQmDRPauEfndJK?=
 =?us-ascii?Q?FzI87boLGFEPmw+VJ3ntY+DNU34mPaazRRxQ3INJR8TItKR5hz40x6bOT5xV?=
 =?us-ascii?Q?SVTSG5RymRjPAiwneqtW/DpGe4Snv4VW2tC8e56uphRZSPoZxZAU4wpPipA6?=
 =?us-ascii?Q?a1UtL5KAhwe1TsxwWr2n0z6l2as1/xv3TDxXI/nFBQezCKh4ZFRxVLw5oetf?=
 =?us-ascii?Q?UQT5XYP3kI2Mew5ZSw44nKM2y0Lt3zYcZYF7ON+JYe8E5YfdBpvwgqdcB2is?=
 =?us-ascii?Q?VPAy6uniQ2dluqSbOwz+lfFnyreNZEw62z0SH5jihZgoyU31KB8em0fafQvk?=
 =?us-ascii?Q?UzEl2RBgfM1Ru3FADqG8GmSIJ4wCPVvlet7BHwwpX0hMh/TzDtKlGe9+jze5?=
 =?us-ascii?Q?YX70HmHbi0zYUCV3hYX+U0b/mNz+9xiys5CuOD1YtJgdtr1ytAvP9XzSR7OB?=
 =?us-ascii?Q?k29D0gI3Yvv093jL27fenXjFbKdFp0lAiewdmZ7woMFHdnxKblW25d31voHF?=
 =?us-ascii?Q?7Hrjep4ZmO8mF2jDDi4UZgY9rU2nDyefoyY1gBDXXcv/5xYVxAw9EIAqVlsN?=
 =?us-ascii?Q?jDDbOzQFife+eS3Lh4HgtxgsOIYlI48M5v0aIN2KW1SukbJGkPvHIK3eHIJh?=
 =?us-ascii?Q?szAI5T5QCSddz8YSYejC6Tt76yru29dVRX4kAi72TiR95HNo0hkuNvcVRR86?=
 =?us-ascii?Q?IKYABq4fgQsycXdZr3zqTsAM5A8fg8MEmzh+ZzFqftmCz+Pee4ZONElrnWMF?=
 =?us-ascii?Q?URDn+tmzZvalEPUXnHdqzx1KUcTJ+r6hPb8/ozPYxdHZmsU+TPpxUscMByfZ?=
 =?us-ascii?Q?6iTTWaYxiQvInxDuXLzOIPZ76SfId5pssSCIviDSn7CoiInPpf4b+tO7t3Tq?=
 =?us-ascii?Q?n3xG4oDihWupTndkSJ+GcKj/YXoozmDrwzoQUGlabZCfsAMBXfCAcH0t6/bM?=
 =?us-ascii?Q?38yRRsN9EAq1+Sb7UZGUdHo8DHm4KvAv8EwTGHsSb2u0/rau6zCyy0A31dMx?=
 =?us-ascii?Q?Ua7o7rCI1gbAdhp+geLf1tb5EgpdaAzc5nICuN4iIh7aEO9hrs0GOD4gcjMf?=
 =?us-ascii?Q?V/Fk98pF1LDCD5cQgXPtPnyzLWGrt0fqjf1X3RwvntvGnU0FTAsFdiYjiCYY?=
 =?us-ascii?Q?FstCUy7qxgGCAehR/kIxUqTnuwR1cR6RuUXvmyk+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR04MB3190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774cdf51-20ed-4abb-7456-08dc58836627
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 10:54:15.6966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JgFT8FRyMQutdNlCDF9xO48IGysofYzZ3yMW8FJLYTTfINvm3hJWErHFsxCrgDb3QjfJptXddhbCMewViTNo4IVXM4M1VkrS+XI/3riYYr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7729
X-Mailman-Approved-At: Wed, 10 Apr 2024 08:22:33 +1000
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Gaurav Jain <gaurav.jain@nxp.com>, Catalin Marinas <catalin.marinas@arm.com>, David Howells <dhowells@redhat.com>, "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Moore <paul@paul-moore.com>, Jonathan Corbet <corbet@lwn.net>, Richard Weinberger <richard@nod.at>, "Rafael
 J. Wysocki" <rafael.j.wysocki@intel.com>, James Morris <jmorris@namei.org>, dl-linux-imx <linux-imx@nxp.com>, "Serge E. Hallyn" <serge@hallyn.com>, "Paul E. McKenney" <paulmck@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pankaj Gupta <pankaj.gupta@nxp.com>, sigma star Kernel Team <upstream+dcp@sigma-star.at>, "Steven
 Rostedt \(Google\)" <rostedt@goodmis.org>, David Oberhollenzer <david.oberhollenzer@sigma-star.at>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Randy Dunlap <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>, "linux-security-module@vger.kernel.org" <linux-security-module@vger.kernel.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Tejun Heo <tj@kernel.org>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Varun Sethi <V.Sethi@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi David,

> -----Original Message-----
> From: David Gstir <david@sigma-star.at>
> Sent: Wednesday, April 3, 2024 12:51 PM
> To: Mimi Zohar <zohar@linux.ibm.com>; James Bottomley
> <jejb@linux.ibm.com>; Jarkko Sakkinen <jarkko@kernel.org>; Herbert Xu
> <herbert@gondor.apana.org.au>; David S. Miller <davem@davemloft.net>
> Cc: David Gstir <david@sigma-star.at>; Shawn Guo <shawnguo@kernel.org>;
> Jonathan Corbet <corbet@lwn.net>; Sascha Hauer
> <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; dl-linux-
> imx <linux-imx@nxp.com>; Ahmad Fatoum <a.fatoum@pengutronix.de>;
> sigma star Kernel Team <upstream+dcp@sigma-star.at>; David Howells
> <dhowells@redhat.com>; Li Yang <leoyang.li@nxp.com>; Paul Moore
> <paul@paul-moore.com>; James Morris <jmorris@namei.org>; Serge E.
> Hallyn <serge@hallyn.com>; Paul E. McKenney <paulmck@kernel.org>;
> Randy Dunlap <rdunlap@infradead.org>; Catalin Marinas
> <catalin.marinas@arm.com>; Rafael J. Wysocki
> <rafael.j.wysocki@intel.com>; Tejun Heo <tj@kernel.org>; Steven Rostedt
> (Google) <rostedt@goodmis.org>; linux-doc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-integrity@vger.kernel.org;
> keyrings@vger.kernel.org; linux-crypto@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linuxppc-dev@lists.ozlabs.org; linux-security=
-
> module@vger.kernel.org; Richard Weinberger <richard@nod.at>; David
> Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Subject: [EXT] [PATCH v8 3/6] KEYS: trusted: Introduce NXP DCP-backed
> trusted keys
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> DCP (Data Co-Processor) is the little brother of NXP's CAAM IP.
> Beside of accelerated crypto operations, it also offers support for hardw=
are-
> bound keys. Using this feature it is possible to implement a blob
> mechanism similar to what CAAM offers. Unlike on CAAM, constructing and
> parsing the blob has to happen in software (i.e. the kernel).
>=20
> The software-based blob format used by DCP trusted keys encrypts the
> payload using AES-128-GCM with a freshly generated random key and
> nonce.
> The random key itself is AES-128-ECB encrypted using the DCP unique or
> OTP key.
>=20
> The DCP trusted key blob format is:
> /*
>  * struct dcp_blob_fmt - DCP BLOB format.
>  *
>  * @fmt_version: Format version, currently being %1
>  * @blob_key: Random AES 128 key which is used to encrypt @payload,
>  *            @blob_key itself is encrypted with OTP or UNIQUE device key=
 in
>  *            AES-128-ECB mode by DCP.
>  * @nonce: Random nonce used for @payload encryption.
>  * @payload_len: Length of the plain text @payload.
>  * @payload: The payload itself, encrypted using AES-128-GCM and
> @blob_key,
>  *           GCM auth tag of size AES_BLOCK_SIZE is attached at the end o=
f it.
>  *
>  * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) +
> @payload_len +
>  * AES_BLOCK_SIZE.
>  */
> struct dcp_blob_fmt {
>         __u8 fmt_version;
>         __u8 blob_key[AES_KEYSIZE_128];
>         __u8 nonce[AES_KEYSIZE_128];
>         __le32 payload_len;
>         __u8 payload[];
> } __packed;
>=20
> By default the unique key is used. It is also possible to use the OTP key=
.
> While the unique key should be unique it is not documented how this key i=
s
> derived. Therefore selection the OTP key is supported as well via the
> use_otp_key module parameter.
>=20
> Co-developed-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> Co-developed-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
> Signed-off-by: David Gstir <david@sigma-star.at>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
>  include/keys/trusted_dcp.h                |  11 +
>  security/keys/trusted-keys/Kconfig        |   8 +
>  security/keys/trusted-keys/Makefile       |   2 +
>  security/keys/trusted-keys/trusted_core.c |   6 +-
>  security/keys/trusted-keys/trusted_dcp.c  | 313
> ++++++++++++++++++++++
>  5 files changed, 339 insertions(+), 1 deletion(-)  create mode 100644
> include/keys/trusted_dcp.h  create mode 100644 security/keys/trusted-
> keys/trusted_dcp.c
>=20
> diff --git a/include/keys/trusted_dcp.h b/include/keys/trusted_dcp.h new
> file mode 100644 index 000000000000..9aaa42075b40
> --- /dev/null
> +++ b/include/keys/trusted_dcp.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2021 sigma star gmbh
> + */
> +
> +#ifndef TRUSTED_DCP_H
> +#define TRUSTED_DCP_H
> +
> +extern struct trusted_key_ops dcp_trusted_key_ops;
> +
> +#endif
> diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-
> keys/Kconfig
> index 553dc117f385..1fb8aa001995 100644
> --- a/security/keys/trusted-keys/Kconfig
> +++ b/security/keys/trusted-keys/Kconfig
> @@ -39,6 +39,14 @@ config TRUSTED_KEYS_CAAM
>           Enable use of NXP's Cryptographic Accelerator and Assurance Mod=
ule
>           (CAAM) as trusted key backend.
>=20
> +config TRUSTED_KEYS_DCP
> +       bool "DCP-based trusted keys"
> +       depends on CRYPTO_DEV_MXS_DCP >=3D TRUSTED_KEYS
> +       default y
> +       select HAVE_TRUSTED_KEYS
> +       help
> +         Enable use of NXP's DCP (Data Co-Processor) as trusted key back=
end.
> +
>  if !HAVE_TRUSTED_KEYS
>         comment "No trust source selected!"
>  endif
> diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-
> keys/Makefile
> index 735aa0bc08ef..f0f3b27f688b 100644
> --- a/security/keys/trusted-keys/Makefile
> +++ b/security/keys/trusted-keys/Makefile
> @@ -14,3 +14,5 @@ trusted-$(CONFIG_TRUSTED_KEYS_TPM) +=3D
> tpm2key.asn1.o
>  trusted-$(CONFIG_TRUSTED_KEYS_TEE) +=3D trusted_tee.o
>=20
>  trusted-$(CONFIG_TRUSTED_KEYS_CAAM) +=3D trusted_caam.o
> +
> +trusted-$(CONFIG_TRUSTED_KEYS_DCP) +=3D trusted_dcp.o
> diff --git a/security/keys/trusted-keys/trusted_core.c
> b/security/keys/trusted-keys/trusted_core.c
> index fee1ab2c734d..5113aeae5628 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -10,6 +10,7 @@
>  #include <keys/trusted-type.h>
>  #include <keys/trusted_tee.h>
>  #include <keys/trusted_caam.h>
> +#include <keys/trusted_dcp.h>
>  #include <keys/trusted_tpm.h>
>  #include <linux/capability.h>
>  #include <linux/err.h>
> @@ -30,7 +31,7 @@ MODULE_PARM_DESC(rng, "Select trusted key RNG");
>=20
>  static char *trusted_key_source;
>  module_param_named(source, trusted_key_source, charp, 0); -
> MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee or
> caam)");
> +MODULE_PARM_DESC(source, "Select trusted keys source (tpm, tee, caam
> or
> +dcp)");
>=20
>  static const struct trusted_key_source trusted_key_sources[] =3D {  #if
> defined(CONFIG_TRUSTED_KEYS_TPM) @@ -42,6 +43,9 @@ static const
> struct trusted_key_source trusted_key_sources[] =3D {  #if
> defined(CONFIG_TRUSTED_KEYS_CAAM)
>         { "caam", &trusted_key_caam_ops },  #endif
> +#if defined(CONFIG_TRUSTED_KEYS_DCP)
> +       { "dcp", &dcp_trusted_key_ops }, #endif
>  };
>=20
>  DEFINE_STATIC_CALL_NULL(trusted_key_seal, *trusted_key_sources[0].ops-
> >seal);
> diff --git a/security/keys/trusted-keys/trusted_dcp.c
> b/security/keys/trusted-keys/trusted_dcp.c
> new file mode 100644
> index 000000000000..16c44aafeab3
> --- /dev/null
> +++ b/security/keys/trusted-keys/trusted_dcp.c
> @@ -0,0 +1,313 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 sigma star gmbh
> + */
> +
> +#include <crypto/aead.h>
> +#include <crypto/aes.h>
> +#include <crypto/algapi.h>
> +#include <crypto/gcm.h>
> +#include <crypto/skcipher.h>
> +#include <keys/trusted-type.h>
> +#include <linux/key-type.h>
> +#include <linux/module.h>
> +#include <linux/printk.h>
> +#include <linux/random.h>
> +#include <linux/scatterlist.h>
> +#include <soc/fsl/dcp.h>
> +
> +#define DCP_BLOB_VERSION 1
> +#define DCP_BLOB_AUTHLEN 16
> +
> +/**
> + * struct dcp_blob_fmt - DCP BLOB format.
> + *
> + * @fmt_version: Format version, currently being %1.
> + * @blob_key: Random AES 128 key which is used to encrypt @payload,
> + *            @blob_key itself is encrypted with OTP or UNIQUE device ke=
y in
> + *            AES-128-ECB mode by DCP.
> + * @nonce: Random nonce used for @payload encryption.
> + * @payload_len: Length of the plain text @payload.
> + * @payload: The payload itself, encrypted using AES-128-GCM and
> @blob_key,
> + *           GCM auth tag of size DCP_BLOB_AUTHLEN is attached at the en=
d of
> it.
> + *
> + * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) +
> @payload_len +
> + * DCP_BLOB_AUTHLEN.
> + */
> +struct dcp_blob_fmt {
> +       __u8 fmt_version;
> +       __u8 blob_key[AES_KEYSIZE_128];
> +       __u8 nonce[AES_KEYSIZE_128];
> +       __le32 payload_len;
> +       __u8 payload[];
> +} __packed;
> +
> +static bool use_otp_key;
> +module_param_named(dcp_use_otp_key, use_otp_key, bool, 0);
> +MODULE_PARM_DESC(dcp_use_otp_key, "Use OTP instead of UNIQUE key
> for sealing");
> +
> +static bool skip_zk_test;
> +module_param_named(dcp_skip_zk_test, skip_zk_test, bool, 0);
> +MODULE_PARM_DESC(dcp_skip_zk_test, "Don't test whether device keys
> are zero'ed");
> +
> +static unsigned int calc_blob_len(unsigned int payload_len)
> +{
> +       return sizeof(struct dcp_blob_fmt) + payload_len +
> DCP_BLOB_AUTHLEN;
> +}
> +
> +static int do_dcp_crypto(u8 *in, u8 *out, bool do_encrypt)
> +{
> +       struct skcipher_request *req =3D NULL;
> +       struct scatterlist src_sg, dst_sg;
> +       struct crypto_skcipher *tfm;
> +       u8 paes_key[DCP_PAES_KEYSIZE];
> +       DECLARE_CRYPTO_WAIT(wait);
> +       int res =3D 0;
> +
> +       if (use_otp_key)
> +               paes_key[0] =3D DCP_PAES_KEY_OTP;
> +       else
> +               paes_key[0] =3D DCP_PAES_KEY_UNIQUE;
> +
> +       tfm =3D crypto_alloc_skcipher("ecb-paes-dcp", CRYPTO_ALG_INTERNAL=
,
> +                                   CRYPTO_ALG_INTERNAL);
> +       if (IS_ERR(tfm)) {
> +               res =3D PTR_ERR(tfm);
> +               tfm =3D NULL;
> +               goto out;
> +       }
> +
> +       req =3D skcipher_request_alloc(tfm, GFP_NOFS);
> +       if (!req) {
> +               res =3D -ENOMEM;
> +               goto out;
> +       }
> +
> +       skcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG
> |
> +                                     CRYPTO_TFM_REQ_MAY_SLEEP,
> +                                     crypto_req_done, &wait);
> +       res =3D crypto_skcipher_setkey(tfm, paes_key, sizeof(paes_key));
> +       if (res < 0)
> +               goto out;
> +
> +       sg_init_one(&src_sg, in, AES_KEYSIZE_128);
> +       sg_init_one(&dst_sg, out, AES_KEYSIZE_128);
> +       skcipher_request_set_crypt(req, &src_sg, &dst_sg, AES_KEYSIZE_128=
,
> +                                  NULL);
> +
> +       if (do_encrypt)
> +               res =3D crypto_wait_req(crypto_skcipher_encrypt(req), &wa=
it);
> +       else
> +               res =3D crypto_wait_req(crypto_skcipher_decrypt(req), &wa=
it);
> +
> +out:
> +       skcipher_request_free(req);
> +       crypto_free_skcipher(tfm);
> +
> +       return res;
> +}
> +
> +static int do_aead_crypto(u8 *in, u8 *out, size_t len, u8 *key, u8 *nonc=
e,
> +                         bool do_encrypt)
> +{
> +       struct aead_request *aead_req =3D NULL;
> +       struct scatterlist src_sg, dst_sg;
> +       struct crypto_aead *aead;
> +       int ret;
> +
> +       aead =3D crypto_alloc_aead("gcm(aes)", 0, CRYPTO_ALG_ASYNC);
> +       if (IS_ERR(aead)) {
> +               ret =3D PTR_ERR(aead);
> +               goto out;
> +       }
> +
> +       ret =3D crypto_aead_setauthsize(aead, DCP_BLOB_AUTHLEN);
> +       if (ret < 0) {
> +               pr_err("Can't set crypto auth tag len: %d\n", ret);
> +               goto free_aead;
> +       }
> +
> +       aead_req =3D aead_request_alloc(aead, GFP_KERNEL);
> +       if (!aead_req) {
> +               ret =3D -ENOMEM;
> +               goto free_aead;
> +       }
> +
> +       sg_init_one(&src_sg, in, len);
> +       if (do_encrypt) {
> +               /*
> +                * If we encrypt our buffer has extra space for the auth =
tag.
> +                */
> +               sg_init_one(&dst_sg, out, len + DCP_BLOB_AUTHLEN);
> +       } else {
> +               sg_init_one(&dst_sg, out, len);
> +       }
> +
> +       aead_request_set_crypt(aead_req, &src_sg, &dst_sg, len, nonce);
> +       aead_request_set_callback(aead_req, CRYPTO_TFM_REQ_MAY_SLEEP,
> NULL,
> +                                 NULL);
> +       aead_request_set_ad(aead_req, 0);
> +
> +       if (crypto_aead_setkey(aead, key, AES_KEYSIZE_128)) {
> +               pr_err("Can't set crypto AEAD key\n");
> +               ret =3D -EINVAL;
> +               goto free_req;
> +       }
> +
> +       if (do_encrypt)
> +               ret =3D crypto_aead_encrypt(aead_req);
> +       else
> +               ret =3D crypto_aead_decrypt(aead_req);
> +
> +free_req:
> +       aead_request_free(aead_req);
> +free_aead:
> +       crypto_free_aead(aead);
> +out:
> +       return ret;
> +}
> +
> +static int decrypt_blob_key(u8 *key)
> +{
> +       return do_dcp_crypto(key, key, false);
> +}
> +
> +static int encrypt_blob_key(u8 *key)
> +{
> +       return do_dcp_crypto(key, key, true);
> +}
> +
> +static int trusted_dcp_seal(struct trusted_key_payload *p, char *datablo=
b)
> +{
> +       struct dcp_blob_fmt *b =3D (struct dcp_blob_fmt *)p->blob;
> +       int blen, ret;
> +
> +       blen =3D calc_blob_len(p->key_len);
> +       if (blen > MAX_BLOB_SIZE)
> +               return -E2BIG;
> +
> +       b->fmt_version =3D DCP_BLOB_VERSION;
> +       get_random_bytes(b->nonce, AES_KEYSIZE_128);
> +       get_random_bytes(b->blob_key, AES_KEYSIZE_128);

We can use HWRNG instead of using kernel RNG. Please refer drivers/char/hw_=
random/imx-rngc.c=20
> +
> +       ret =3D do_aead_crypto(p->key, b->payload, p->key_len, b->blob_ke=
y,
> +                            b->nonce, true);
> +       if (ret) {
> +               pr_err("Unable to encrypt blob payload: %i\n", ret);
> +               return ret;
> +       }
> +
> +       ret =3D encrypt_blob_key(b->blob_key);
> +       if (ret) {
> +               pr_err("Unable to encrypt blob key: %i\n", ret);
> +               return ret;
> +       }
> +
> +       b->payload_len =3D get_unaligned_le32(&p->key_len);
> +       p->blob_len =3D blen;
> +       return 0;
> +}
> +
> +static int trusted_dcp_unseal(struct trusted_key_payload *p, char
> *datablob)
> +{
> +       struct dcp_blob_fmt *b =3D (struct dcp_blob_fmt *)p->blob;
> +       int blen, ret;
> +
> +       if (b->fmt_version !=3D DCP_BLOB_VERSION) {
> +               pr_err("DCP blob has bad version: %i, expected %i\n",
> +                      b->fmt_version, DCP_BLOB_VERSION);
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       p->key_len =3D le32_to_cpu(b->payload_len);
> +       blen =3D calc_blob_len(p->key_len);
> +       if (blen !=3D p->blob_len) {
> +               pr_err("DCP blob has bad length: %i !=3D %i\n", blen,
> +                      p->blob_len);
> +               ret =3D -EINVAL;
> +               goto out;
> +       }
> +
> +       ret =3D decrypt_blob_key(b->blob_key);
> +       if (ret) {
> +               pr_err("Unable to decrypt blob key: %i\n", ret);
> +               goto out;
> +       }
> +
> +       ret =3D do_aead_crypto(b->payload, p->key, p->key_len +
> DCP_BLOB_AUTHLEN,
> +                            b->blob_key, b->nonce, false);
> +       if (ret) {
> +               pr_err("Unwrap of DCP payload failed: %i\n", ret);
> +               goto out;
> +       }
> +
> +       ret =3D 0;
> +out:
> +       return ret;
> +}
> +
> +static int test_for_zero_key(void)
> +{
> +       /*
> +        * Encrypting a plaintext of all 0x55 bytes will yield
> +        * this ciphertext in case the DCP test key is used.
> +        */
> +       static const u8 bad[] =3D {0x9a, 0xda, 0xe0, 0x54, 0xf6, 0x3d, 0x=
fa, 0xff,
> +                                0x5e, 0xa1, 0x8e, 0x45, 0xed, 0xf6, 0xea=
, 0x6f};
> +       void *buf =3D NULL;
> +       int ret =3D 0;
> +
> +       if (skip_zk_test)
> +               goto out;
> +
> +       buf =3D kmalloc(AES_BLOCK_SIZE, GFP_KERNEL);
> +       if (!buf) {
> +               ret =3D -ENOMEM;
> +               goto out;
> +       }
> +
> +       memset(buf, 0x55, AES_BLOCK_SIZE);
> +
> +       ret =3D do_dcp_crypto(buf, buf, true);
> +       if (ret)
> +               goto out;
> +
> +       if (memcmp(buf, bad, AES_BLOCK_SIZE) =3D=3D 0) {
> +               pr_warn("Device neither in secure nor trusted mode!\n");
> +               ret =3D -EINVAL;
> +       }
> +out:
> +       kfree(buf);
> +       return ret;
> +}
> +
> +static int trusted_dcp_init(void)
> +{
> +       int ret;
> +
> +       if (use_otp_key)
> +               pr_info("Using DCP OTP key\n");
> +
> +       ret =3D test_for_zero_key();
> +       if (ret) {
> +               pr_warn("Test for zero'ed keys failed: %i\n", ret);
> +
> +               return -EINVAL;
> +       }
> +
> +       return register_key_type(&key_type_trusted);
> +}
> +
> +static void trusted_dcp_exit(void)
> +{
> +       unregister_key_type(&key_type_trusted);
> +}
> +
> +struct trusted_key_ops dcp_trusted_key_ops =3D {
> +       .exit =3D trusted_dcp_exit,
> +       .init =3D trusted_dcp_init,
> +       .seal =3D trusted_dcp_seal,
> +       .unseal =3D trusted_dcp_unseal,
> +       .migratable =3D 0,
> +};
> --
> 2.35.3
>=20

Regards,
Kshitiz
