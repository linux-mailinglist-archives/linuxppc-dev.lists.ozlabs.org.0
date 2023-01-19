Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C3673D2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 16:10:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyR0J4TrSz3fGy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 02:10:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=o+CX5sP+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=garyguo.net (client-ip=40.107.10.126; helo=gbr01-lo2-obe.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=o+CX5sP+;
	dkim-atps=neutral
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01on2126.outbound.protection.outlook.com [40.107.10.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyQzH73g8z3bTq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 02:10:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUGwiuhL7/ESn/i/WUDFkpMbBWIjTQ/XFHZWam/2VkgjpEw1OXo5XuM7jos1J+apU9r4gsbGlgLFxMV6qOdWhQny1WZpYwf72AkjnjMsCAAybqsVyR+g1k5wZzPz58Qoe1gZiMjs0sQcOUNh9M4ekZOctu1R3riohWHFEVbwtWiyJJb5vuSjVVq7t3A4AZnZ62HbetIiOAK8t+ARQlCkrZbNEzwQZRAg0SNaviXtZNBJNDpy0YiqhyQSRB9r/JSO7nL4q2vyktDCDkrv/bBoXP+nbvmiXlg4xiThqgXtA8qhy11xArvKrByF16sO3r7MC57xOgMFzQFMUOK6gun8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VOX2/R4y8I8BSBGEGaJUDozJAEVirCrmPNZL89BRJ4=;
 b=Vs2d4Uc4aPJ637BiSTNhbDXFLA4xgo7YcOql6OZxRCemVWYtFh4ou78TjwlSdVtMwyQt4VB4dzfSmNvrBQmmeU2gWWCb9j8mIk7lWk5cUKv/R28fjXHsKvWslLbacTNJ8lAuqO/cMHdo3b4g7NE5B0+s+O/KUdQMAzBe/RQkU1PQtv335SxkpIVXitZPUfKIdcV+FmMDBiGRqkGn8dt53PFZysXkXsyyQmjaHzAwlxtf4VVq5GC4Xy91CYPtxUvWf8gwUMXLoLxhtSnvl96ThO2i97uvC94ti7LlniaoXw7KvebPnnpaXn5mU6fB2WjkKsLigDyePYu+p0Tjwr0www==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VOX2/R4y8I8BSBGEGaJUDozJAEVirCrmPNZL89BRJ4=;
 b=o+CX5sP+prnN/TQP5nd0xdAMRDswTGI0eGYhJdLLbjM9qx75TQXe4iLTq83UVDZoInxisegVpV9h5QzJJaMkaSyUXUFNpyqhUaI1c8zUV7upVFrWH4CmBjZbWx/x/hZVSgo2aeGOu+LvXUnjhnuHKY8rLjlGED45HCYwrVgernc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB6947.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ec::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 15:09:39 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2f24:8099:5588:8ba8]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2f24:8099:5588:8ba8%8]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 15:09:39 +0000
Date: Thu, 19 Jan 2023 15:09:36 +0000
From: Gary Guo <gary@garyguo.net>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <20230119150936.30811312.gary@garyguo.net>
In-Reply-To: <20230117192059.z5v5lfc2bzxk4ad2@ldmartin-desk2.lan>
References: <20230111161155.1349375-1-gary@garyguo.net>
	<20230112214059.o4vq474c47edjup6@ldmartin-desk2>
	<20230113181841.4d378a24.gary@garyguo.net>
	<20230117175144.GI16547@kitsune.suse.cz>
	<20230117192059.z5v5lfc2bzxk4ad2@ldmartin-desk2.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 64797cba-7dbb-4055-ae9e-08dafa2f2f40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jiGj5b4+B+Wfii/chtfcoxAa+EZ5dHOz/Jn7tqqLsaUnYJXiiQBa1CowwanfOjt7XI7QmkYFUHYOtIFNEDRVYLvqkmE7CUONuxCl+cEkBkZ0GDbXzi4cMl7UAeiPJUDIqnq+L8lYWYyRWJO1BQ8a/vPdNToER/OUb7+2UoDhjg/P2yFXoshZwM37VVkOHDrpp5Kh1iHDULkVf1jmP2ay3GhcN+HqdkYEtU971ktE0OFNwL2SVereEsmqaOdw3VsrCL5CJyJmBEmhYo8pZ07g4WwOoU5nAgyYCKHWDUSb2cwIUzHYAV7XhCsylEk5MAbb3NvE6GQCRDP4mg/vKBH1jrBs33IGwKSQGoOtaIkbc1nyCTpHwYgoYVTPr9kW56qB/3LnLFz2EP1VEz5zhjCTuxhYvurTUj2U7vewz+17AKCVDsm7VAk8JVgS9FMO1RV3Xlf3Lb3P3wOhQZz+5D1E3bVs02GhkNB1hxhZjnPCUtuX6l8s7dU5v+iFS6zGu55RFRz1426pvlrGB4X8PkMDsskaLTy4Nudx67DHrEBHSH2utM/xFhDx1nUkUkMmGtMR7jInGizJ+BA20O7CvgduBwu9+jb93rgrpB4cEW8cHiXd9kRkGf5YJyV/COXGqMGkfnXm+QAl7onULBdzdW3J0w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(346002)(136003)(39830400003)(451199015)(6486002)(26005)(66556008)(478600001)(41300700001)(6512007)(66574015)(1076003)(186003)(86362001)(316002)(54906003)(2616005)(38100700002)(66946007)(66476007)(6506007)(36756003)(6666004)(2906002)(5660300002)(7416002)(4326008)(6916009)(83380400001)(8936002)(8676002)(66899015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NWo5d1A0Mk1xMkZtWlpXVEU4NnY2dDlZL2pDcEU4Z1BnRTJBVnp6UXdnRWMz?=
 =?utf-8?B?S0IyRllqMzlzQlk5WUNwQmtYUklKQktNYnR0THlIQTh3VWd5Tlp0dmVmZENR?=
 =?utf-8?B?V1dyVG5CL3h6c3JwWFhRbElLeVB4YldNVzAzS3dKd2lESmRZVmZZdUxxMlBs?=
 =?utf-8?B?bURXMU9pSHh6T0dNTmhrTmtkZUxRL2lRNXFhN2k5ck05Q0RCVkRESVZWRTlo?=
 =?utf-8?B?czE2dy95emtBZHd5U0N6T01VS0V2MGZvazhvTUsvc0wycEJxQ0NFM1pFMlJh?=
 =?utf-8?B?cjRwRzNZT0JWM2ZYSnQ4TDhkczRUazNjenhaRUNOWlNYTzdPUEx1cnlQM3Er?=
 =?utf-8?B?bGwwK0hKVU9xcGFvOVFJQkhFNkQ1VWlyOTZHMFBEeU0zY1M4ZUlGbWt4ejBX?=
 =?utf-8?B?bGZGdmZ6REJDd2sveXlaaE9wcnJ2azZtTHozT1R1V2lqVGg1M0x2Y1loTzE1?=
 =?utf-8?B?QmU4dTF3elNtZkNqYWZQeWs4a3FnTVhYaHUyZGd4L1RDdUNQWXpSd0tzVkFL?=
 =?utf-8?B?MkhxdDRKY1E4SThWMytwYkM1UWxiY2VsNmhpR1ErRzJVS25HVUp3Y2lHTkV1?=
 =?utf-8?B?ZXl0SzFHQVlsbGVLdzFhY3FxczVudWhBYUYzSFhnMDRpOS8va0xBM0FTU2k3?=
 =?utf-8?B?OGkrTkhpR3hhYjJ5aEpQT2xUZTZSSmJOU2t6NFVVSUNrWlNwdEZTR0dtL3I5?=
 =?utf-8?B?TUdqZ2xnZ0VCVkZYUzE0YXJaTzJYb0Z0MWRqVGVwTWtzckZYQnBUanN3aXEr?=
 =?utf-8?B?ODkxZE42Mkc4VkJDV2hMNzNXVlVvWm1HaTZuV3ozWXBkK1VlenQ2d2lyME1O?=
 =?utf-8?B?MW0vem5Bc0RxaEVoRHBLOUdmSmY0eElod2MzV1JxWElNaHh1U3h0QytwYkNP?=
 =?utf-8?B?VHdobEZoYzRidjUzQ0Q3NEt5MmdxYmhxYUtFSDZVVk9vNVlYRmFBVFZFa1c0?=
 =?utf-8?B?eFlPY3h6ZEtOVGVkU1VVMnhNVWV6Tmgvb2JFUXVjQnZYZGNIek1ac3JSSjly?=
 =?utf-8?B?NXVEVVl2ZDQ2TE9lRDBMeGhBa3dSR25WM1B6SnBJLzN5dGc0RHppYXcvcWQ2?=
 =?utf-8?B?N2s5R2ZibDlZZ2lUZGczaFoyR2pQaVNpV21ZUnBEbzdOVUx6MU0rQnB6ZU0r?=
 =?utf-8?B?UTN0U2lYdmY1a2poWS9qdVNzSGY4NHkrQWZpMVJ1UkJjRDFKSmlTZEhFNTZz?=
 =?utf-8?B?V2YyK21ybk80ZkRCaFFHZDBWQ0h3MjlBRHFkNCtIbGQ4NzhqcEYvRDZBQ1FB?=
 =?utf-8?B?MjdZZXcvdkZyaUk4QWNvaFVadDVZUTlJaHBuVW9JMVk2T0MzR1V2cHNra1Q0?=
 =?utf-8?B?cDlXUTMvelpzeDlOQitRcFNNNXp5UXUwSTUyY0dPbklMaUhpZGhoM0xWaGhu?=
 =?utf-8?B?REJlZWFRbDgvN2hZRXNZUGpsd2tnZ2JvTzJ1MHVTcUllSm9Ub2NMR3d5SW94?=
 =?utf-8?B?NGN5YnkyemU4aE9JeE0yM1Rld2M1V1JYRmU2WTRwcUhJY2tiMDdDWm80VUUv?=
 =?utf-8?B?SmNDUWpkUk1mOGNqVWtFZEtESW40UWdJd1ZyRGFKTkptM1NrRXV0aWF0dnFE?=
 =?utf-8?B?WkJZSzJTbzdRWnFGSngvbmdmc1hjY2VmWmtJR1JsWm5ETThEU1dFT2cvZEFM?=
 =?utf-8?B?cjR0dWxFdlZmckFibmhXMDJPRm9QbW9uSjBGWTVzbnVuK05XZXI0Vzl6LzRi?=
 =?utf-8?B?RTV4UGp3YTVGbTJFWnY5a2JxYkNVaGFxYnhtaXF0bU9kOXJrREJHb3lkTmlp?=
 =?utf-8?B?eWFGZ2Q4NkRqWWlFM3g4bkpWSWMwR2dVQk1MS1U4aGlTSG1sVERQWlVBUE5s?=
 =?utf-8?B?dnIvUENzRDc4WG5CTWdUamdubEFkSGNsK3lpMExTdDZrWDNjWjRsR2hRQ2or?=
 =?utf-8?B?Y0VxU3Y3UXU1a1JxRjRmNmM3bWZGdVQ2RXZOMS9EV2NyQm5uWFFGcXZOaGFr?=
 =?utf-8?B?TWZkczNlUUF0UWltYVlKWFZIT2ZvaHFwYU9CYjlwelRNNzE4SHgwQzhYVkNo?=
 =?utf-8?B?dG8vKzFDQ3NPcFJucVJndnBDMHc2UFJUNXhYZWVScHp0UURibnBhRFlaQWw5?=
 =?utf-8?B?YS8vaDJuSlNqOC9xOEJYeEdWUkhvZHhqRy9iekJyZ0F1NTBwMjI2R2xZdVZX?=
 =?utf-8?Q?jSGVxlfTYcJ+8PzhVeGFnIhG+?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 64797cba-7dbb-4055-ae9e-08dafa2f2f40
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 15:09:39.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIXzNLvZr7FsHnmF5247Yhn45RpY4VtkAdSpbW/NXgn5t4VgbLE93lGjsIPdYlVlzRP+SRcGgLXsJcBYkKXt/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6947
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>, Wedson Almeida Filho <wedsonaf@google.com>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Wedson Almeida
 Filho <wedsonaf@gmail.com>, Kees Cook <keescook@chromium.org>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Luis
 Chamberlain <mcgrof@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 17 Jan 2023 11:22:45 -0800
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Tue, Jan 17, 2023 at 06:51:44PM +0100, Michal Such=C3=A1nek wrote:
> >Hello,
> >
> >On Fri, Jan 13, 2023 at 06:18:41PM +0000, Gary Guo wrote: =20
> >> On Thu, 12 Jan 2023 14:40:59 -0700
> >> Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >> =20
> >> > On Wed, Jan 11, 2023 at 04:11:51PM +0000, Gary Guo wrote: =20
> >> > >
> >> > > struct modversion_info {
> >> > >-	unsigned long crc;
> >> > >-	char name[MODULE_NAME_LEN];
> >> > >+	/* Offset of the next modversion entry in relation to this one. *=
/
> >> > >+	u32 next;
> >> > >+	u32 crc;
> >> > >+	char name[0]; =20
> >> >
> >> > although not really exported as uapi, this will break userspace as t=
his is
> >> > used in the  elf file generated for the modules. I think
> >> > this change must be made in a backward compatible way and kmod updat=
ed
> >> > to deal with the variable name length:
> >> >
> >> > kmod $ git grep "\[64"
> >> > libkmod/libkmod-elf.c:  char name[64 - sizeof(uint32_t)];
> >> > libkmod/libkmod-elf.c:  char name[64 - sizeof(uint64_t)];
> >> >
> >> > in kmod we have both 32 and 64 because a 64-bit kmod can read both 3=
2
> >> > and 64 bit module, and vice versa.
> >> > =20
> >>
> >> Hi Lucas,
> >>
> >> Thanks for the information.
> >>
> >> The change can't be "truly" backward compatible, in a sense that
> >> regardless of the new format we choose, kmod would not be able to deco=
de
> >> symbols longer than "64 - sizeof(long)" bytes. So the list it retrieve=
s
> >> is going to be incomplete, isn't it?
> >>
> >> What kind of backward compatibility should be expected? It could be:
> >> * short symbols can still be found by old versions of kmod, but not
> >>   long symbols; =20
> >
> >That sounds good. Not everyone is using rust, and with this option
> >people who do will need to upgrade tooling, and people who don't care
> >don't need to do anything. =20
>=20
> that could be it indeed. My main worry here is:
>=20
> "After the support is added in kmod, kmod needs to be able to output the
> correct information regardless if the module is from before/after the
> change in the kernel and also without relying on kernel version."
> Just changing the struct modversion_info doesn't make that possible.
>=20
> Maybe adding the long symbols in another section?

Yeah, that's what I imagined how it could be implemented when I said
"short symbols can still be found by old versions of kmod, but not long
symbols".

> Or ble just increase to 512 and add the size to a
> "__versions_hdr" section. If we then output a max size per module,
> this would offset a little bit the additional size gained for the
> modules using rust.

That format isn't really elegant IMO. And symbol length can vary a lot,
having all symbols dictated by the longest symbol doesn't sound a good
approach.

> And the additional 0's should compress well
> so I'm not sure the additional size is that much relevant here.

I am not sure why compression is mentioned here. I don't think section
in .ko files are compressed.

(sorry forget to reply-all, re-send email to the list)

Best,
Gary
