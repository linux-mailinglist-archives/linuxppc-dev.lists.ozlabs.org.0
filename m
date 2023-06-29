Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE5C742B39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 19:30:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KLDxah2R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsQSg6jQwz3bZ4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 03:30:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=KLDxah2R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eaa::61a; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=mario.limonciello@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsQRk3SlDz3bTb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 03:29:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W44VfxYoTmWZGNLyUeGFSHYYChg3A6Kzir9lC2fKMHmhoueklGjWWKpu304Tx3a2nyjfZHNZaDOOaqw2nM8QNAxvTuXYz78XZWqB0YQDH/uy8KqDXXpj/8MPaRnzLZWs238ejiH0VavWjjPw4d/Z09BGq1fidOxOodzAZF6b5QLvGBACMSZBeAGwurVvuXvDCZ6W0i8ot8/GM1NEMFM1y3p/KiobIJT3rYwT2xuXOv9r92wXP0qODEkcEM3q4YmIcUC7Zl/krBoJfNA+GVnZP5Sxel7mlIqPNdArC4A9FdiHtzSJppp/D0dLLAaXE8LiIFRLHVHAfMaP3pCI6Sidrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PN+JkhweTcR/AIo67IQquW7hZi0lSdnbv/1if/KndRc=;
 b=gcMbwiPzzDlYcvMD+qx7KWMZbASTJkLleis0Ys9Tdcrd6ih8aJTcBuFBjc89/+X3Au0I9XBFBtLFcVDKO3RzIrKrD6kb1U4ZSxJkOB5Dzvfl8IYWIqEz6nNJizv5A77+yI81h+wRBBD8qVwwEDrryJwUOFC4rzLTsoKIhM+H5kTnQWAzp+GzEWsKXGkjodf8qhjGu64jP6i8a3SvFhPsCwLmloVSXC7d6OV8o/c/pMrKiQ7mJIU2xeAQj7Qg1QC1cFdl+vBK8k/0sm56FeD6wVkG5QelYXWf6zW3cpvEJEcgJ/ybbDIOlglgCWbQp0vuhqgvEo+oUFoQgKaF95csDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PN+JkhweTcR/AIo67IQquW7hZi0lSdnbv/1if/KndRc=;
 b=KLDxah2RdkoXljk44FBI3EyiklMS3pZsKGoQmFsFc6J1agjk1P7xVn7PN7HLUx00vdgQ9+nsk2ISV6tBenyjQdlLBu8qHpZ+NUjqQA8fAR0E8KHHIQwd2Q7eGSYYCZKZ3GMvz6ZfXd1ecgfSA9teNzRPm0E0nOHscYGq1dvGZ6g=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 17:28:58 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dfcf:f53c:c778:6f70%5]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 17:28:58 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Jerry Snitselaar <jsnitsel@redhat.com>
Subject: RE: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
Thread-Topic: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
Thread-Index: AQHZpQYzLgs+SZK7S0mjzkR6+Tm69a+W5EEAgAsp34CAAAN8UA==
Date: Thu, 29 Jun 2023 17:28:58 +0000
Message-ID:  <MN0PR12MB6101C50288F6FE99A3DA5D4FE225A@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
 <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
 <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
 <87o7l7oer1.fsf@mail.lhotse> <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
 <c53ihvuesmymj2o5jyqz7gw7mvbrxjifmphuuhiux3qjabjnic@wcak4hfb77td>
In-Reply-To: <c53ihvuesmymj2o5jyqz7gw7mvbrxjifmphuuhiux3qjabjnic@wcak4hfb77td>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels:  MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=fdae868f-0e70-4c8f-90c6-2c8fc418b73f;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-29T17:19:35Z;MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB8796:EE_
x-ms-office365-filtering-correlation-id: 5212af7f-2fba-431f-9578-08db78c65235
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iKhoa4iOQsa9v8wRDK2hibn8ZKED9wCBnwAjNyzEEV4wd4sEcGQFe4094oPKy/PPODeXXpNBz7nBmosTawqRc56KQUUU5tqslTOiTG0m176IWuavwl+nzq6AL6pxk/QcvPo+PtHPitWlwC/Zyint/XqXfcGNqV41fjCT8vHyeAeWTAepsYV5hcJyPyZjHcL/rtXUIQErWlg3fpmOdGD7xD+7GP8HzQzkF2Ioew1Yp/+O+xpKyaRSrI93K2OmGfSI9h4+T6CKFoBSDYEDlV0fgqrU7+bHxnDRB/XsLJgJC+EicQUrwuRdUyn3LxbZ3XRDhor1HSN6LzJnVffmFgzKkFchTVvZq0Y9SQD49bkHaOGlOiIYRGhJw9yU3GlyKy+3HkDHcltxBnMWHxFwt1/IJSNybYjKQUfC8B8+Brfswo515LtLbYIn766X1d+S4wxrlnVvyY9NYIN+5pFeu6McHOlRIXLzPRpAtOilF7FWcM6/UsMZ02KVWnWE4mFBCWR5RnQ3ADeK8wvdOVNztSoCFvdKyyD3m+J5lW+pggaLlXdCxd7awMKP65cT7PX+nAagdQBkZE9Qol371yZbbo67oRmo+pG54zo+YJJc3U1gGWWxTwC/7nohiJnnXiTL7riZ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199021)(33656002)(38100700002)(5660300002)(86362001)(41300700001)(6916009)(66476007)(8936002)(8676002)(66446008)(64756008)(38070700005)(316002)(66946007)(122000001)(55016003)(4326008)(66556008)(76116006)(478600001)(52536014)(71200400001)(53546011)(2906002)(9686003)(6506007)(54906003)(186003)(7696005)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?INyTCnLulZnR6KBQKULcSnrIxOV9/gTYL43XcajZLCGY9/pZobddNklawc?=
 =?iso-8859-1?Q?12IasoEDKV3F2MD1Mt5qrF6+aiKziulgo+SVTM/o7+JbmnqiDanh9caAAi?=
 =?iso-8859-1?Q?UgbkaYtkRkljOsQMSJqMw3Iifk7kNwTKCjkeFiW6eHb2LhKR9mO1FWAwjw?=
 =?iso-8859-1?Q?Sc7uuShQHqGF3qw/jkDDcbiB3tRQVzVPLwLo25NlRuXZoWuTtvRDXUcopx?=
 =?iso-8859-1?Q?WnR7/N1payaXtycoBpbWxxUwUMrsr6Ub+p4gyfo5M8g3TV5ZrpuEYckLek?=
 =?iso-8859-1?Q?OyMdZgL0btWyAngDthzaWt7IWsnH8XAnNX4r+fQ2pF0sTy2wEY7ZSQi0xB?=
 =?iso-8859-1?Q?mKUTquQTHQu3KHNCXtqDu2HdtvPw1X8GVnxbygi/FXtqq/8V3dqhUVeuDO?=
 =?iso-8859-1?Q?Bs8QPeLeXXsi3e1tlq/Rciev/kczY15/vOurwWPtz8m5yp2a1H6yaZCpOi?=
 =?iso-8859-1?Q?dQQdxITDc2XlR9e1nGy86RrdgW9HzIufmeFq+C8EpJO15m3c43oFQE5S+y?=
 =?iso-8859-1?Q?RsfGD8kgq+EUDijGt2LaTd4XX6rOoDtQENAbLEKKSgd6KlmRAE3f8Am7u2?=
 =?iso-8859-1?Q?wqVjWtOLRGwIwzlaWlKyz4h8DNkSs0ADeYxuU4eF9aor5BXHfXn9LyhotQ?=
 =?iso-8859-1?Q?UPPJkbR2DthDuec5x4HCAwf12XNtUMOw/Jiv0W7BrMYDHjrUbxT5KE9uvw?=
 =?iso-8859-1?Q?IBa/G2K4bWOPCDi1Z7cfkoJYLHTJnl3+kHNqzVoTCVyOdzWOZMKRMFuwSl?=
 =?iso-8859-1?Q?e+nSfuHOcsOzt45950Ik96VNURQeOk2EnV63rMwcd+uhSOXJUx9ab4T8LB?=
 =?iso-8859-1?Q?JXL+v0HEeZDh9o6LLCDmSTpJYkhgNOY+LUCeM8BOnTUFDXoMcm7ujWj17z?=
 =?iso-8859-1?Q?ZOjIjJ1NJdweUFxMvPZE7QHtId+WGvLtawTcMQZJcxhkyXDRFu3/PaP6gb?=
 =?iso-8859-1?Q?vci47SYZgZ2Wfm93goXQqXwoalMG9oyynRtMiBPmHpLt95lqDjvEM+iVla?=
 =?iso-8859-1?Q?s1jTrIpnqiJ6garePWtCl+H+RuxB7vTLqS91A+nelo4DgAyW2lkGqBH5kE?=
 =?iso-8859-1?Q?4pOcLjiRidNmB7L9z7rBPfCqTMQ7mB1anN+uz9O8trhtT6oAxBv5oKzFKN?=
 =?iso-8859-1?Q?mwYCKRHsGmwpzo+WxnpjxB9XTJyBw/pht37bxk9bt90Y4ZVlotmWI+II7j?=
 =?iso-8859-1?Q?wNDyqFh07ffeCrL3LZv1pR2moSeJXEbpa5HHPW/uPdt/n8tjzxVGEY+mmM?=
 =?iso-8859-1?Q?1RbE0xr9rIdrIp91d4J6q+LrSTbAgrQmwrICpYwh8b3SnHJmn5wX3kPwOj?=
 =?iso-8859-1?Q?UoncKnjURzmg7KPdjVpr52ckodWrtD1qc92aoupCx4JbbFSIpz/UoIRJgD?=
 =?iso-8859-1?Q?4cxOhg3q4vEuWVYeRBXSRrClibsGrfehXD+/v3mvMAX5cgOAF1Baw8kF1I?=
 =?iso-8859-1?Q?RlPZzY+FDBrp97RrcyfNlVNKQKpYbuj4TJzMzOv9Xs0ttptygfM70gmLE/?=
 =?iso-8859-1?Q?1lIebGvYyLquS9VnPpTouBCtptqlJqVfFFWQES55tG2oXIadNqBKOY3qii?=
 =?iso-8859-1?Q?g1Gzv7q0AQyojgRsmaH2bWe/+lwlWvvsOimvDCC5zgmO7zut2fhj5Kk68Q?=
 =?iso-8859-1?Q?u5M70dLs0sYBQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5212af7f-2fba-431f-9578-08db78c65235
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 17:28:58.0697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7F8Xxe7+XnWlnouu3nABAv3vhLoVDSY7gwTJ0x5agpIpA5a/O3/1uXGh2hJYe6DBkb/WpbnEpPA0l/NzMdDWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
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
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, "jarkko@kernel.org" <jarkko@kernel.org>, Sachin Sant <sachinp@linux.ibm.com>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Public]

> -----Original Message-----
> From: Jerry Snitselaar <jsnitsel@redhat.com>
> Sent: Thursday, June 29, 2023 12:07 PM
> To: Limonciello, Mario <Mario.Limonciello@amd.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>; Linux regressions mailing list
> <regressions@lists.linux.dev>; Sachin Sant <sachinp@linux.ibm.com>; open
> list <linux-kernel@vger.kernel.org>; linuxppc-dev <linuxppc-
> dev@lists.ozlabs.org>; jarkko@kernel.org; linux-integrity@vger.kernel.org
> Subject: Re: [6.4-rc6] Crash during a kexec operation
> (tpm_amd_is_rng_defective)
>
> On Thu, Jun 22, 2023 at 09:38:04AM -0500, Limonciello, Mario wrote:
> >
> > On 6/22/2023 7:36 AM, Michael Ellerman wrote:
> > > "Linux regression tracking (Thorsten Leemhuis)"
> <regressions@leemhuis.info> writes:
> > > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posti=
ng
> > > > for once, to make this easily accessible to everyone.
> > > >
> > > > As Linus will likely release 6.4 on this or the following Sunday a =
quick
> > > > question: is there any hope this regression might be fixed any time
> > > > soon?
> > > No.
> > >
> > > I have added the author of the commit to Cc, maybe they can help?
> > >
> > > The immediate question is, is it expected for chip->ops to be NULL in
> > > this path? Obviously on actual AMD systems that isn't the case,
> > > otherwise the code would crash there. But is the fact that chip->ops =
is
> > > NULL a bug in the ibmvtpm driver, or a possibility that has been
> > > overlooked by the checking code.
> > >
> > > cheers
> >
> > All that code assumes that the TPM is still functional which
> > seems not to be the case for your TPM.
> >
> > This should fix it:
> >
> > diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> > index 5be91591cb3b..7082b031741e 100644
> > --- a/drivers/char/tpm/tpm-chip.c
> > +++ b/drivers/char/tpm/tpm-chip.c
> > @@ -525,6 +525,9 @@ static bool tpm_amd_is_rng_defective(struct
> tpm_chip
> > *chip)
> >         u64 version;
> >         int ret;
> >
> > +       if (!chip->ops)
> > +               return false;
> > +
> >         if (!(chip->flags & TPM_CHIP_FLAG_TPM2))
> >                 return false;
>
>
> Should tpm_amd_is_rng_defective compile to nothing on non-x86
> architectures? This code is all about
> working around an issue with the AMD fTPM, right?
>

That's a good point.  Yes it could and that would also solve this problem.

