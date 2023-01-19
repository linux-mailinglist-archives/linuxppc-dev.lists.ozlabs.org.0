Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0825E673E13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 16:58:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyS3V6VBhz3fGn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 02:58:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=QSG5lTW6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=garyguo.net (client-ip=40.107.11.129; helo=gbr01-cwl-obe.outbound.protection.outlook.com; envelope-from=gary@garyguo.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=QSG5lTW6;
	dkim-atps=neutral
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (mail-cwlgbr01on2129.outbound.protection.outlook.com [40.107.11.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyS2Y0JF9z3fDl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 02:57:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCpZimKjjzCJ882+ayOGXASWtzBiloouAFpzmdCkcGFcjV5luTcQVWExglqz3tnA1egN6FRomzW9cHhqls3w8lExlmbWKSyXNMHLDPSFV/wTPsGvq/TSqnoz+8S4udybTkc+2F0PPdMqdCw9BNv2nQucmAbdXYxrZ6fr3tgQ8Don8MkAsqTBgYoN8WvLT3o7WYVma0vqQfE8AjkY92sTIpgNhpvEboKWYZsgluGl/BWjDORpctd0KBdnqLpqC9g4VMiw0P1zbJ4TRR2WGpuzvZiriTWQxCWXV5SCRzyOisqT48/3YjFvjx2Ji4lyrRrXGE3oTSMjgSn4pgmRUJ5pSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvdexPKqAlnDOQR64kzagGxbfyQqNF9vqgufLekoCnA=;
 b=ZbzGNywgeUIM5pbBr4dppBB71JU/ErbGkDm6i48dN/Hdgq49xg+c9Dmv2KaFdMKaznfBe6Mfq37vRDMrGj718sOR5KQB4c7mE81bc+W/WU/a6obE0X0nJSqiPTzhH6bV+7N+IxvFvbzCjRzqejTtzZ/DVINGwhdSuvD560LDeVilosTxi5vl518ZYblcoJx0fnMX3rTzZlq7gpp80D0mH7shLtLDxTcoqXUcwUkc+zy2gqmXznj42VGLvdviOL+7T6QdwGEQMtSriVuwSFvO4JC3m0leTXL5lfym8sAFqeomaOFwzhCMVe5OGNlyhQw3Njof0ZjWfOTKNAgZr8gPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvdexPKqAlnDOQR64kzagGxbfyQqNF9vqgufLekoCnA=;
 b=QSG5lTW65n83udJZuZRUi0/grQDJbn28CzJYc1Ra2q3HM+QNWhfmZZ2P5lDZkr6jqnVg9G9InUnOQjTvb6iW6S0eGSLgk2RajKZG+vtUaf01D6YWgYnwHwExTUrIiNxxK6eTwBsGpufnJwgApl+qOhZyVUFzDNYvpPI1v6JzCMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO3P265MB2121.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 15:57:36 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2f24:8099:5588:8ba8]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::2f24:8099:5588:8ba8%8]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 15:57:36 +0000
Date: Thu, 19 Jan 2023 15:57:09 +0000
From: Gary Guo <gary@garyguo.net>
To: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Subject: Re: [PATCH] modpost: support arbitrary symbol length in modversion
Message-ID: <20230119155709.20d87e35.gary@garyguo.net>
In-Reply-To: <20230119151857.GQ16547@kitsune.suse.cz>
References: <20230111161155.1349375-1-gary@garyguo.net>
	<20230112214059.o4vq474c47edjup6@ldmartin-desk2>
	<20230113181841.4d378a24.gary@garyguo.net>
	<20230117175144.GI16547@kitsune.suse.cz>
	<20230117192059.z5v5lfc2bzxk4ad2@ldmartin-desk2.lan>
	<20230119150936.30811312.gary@garyguo.net>
	<20230119151857.GQ16547@kitsune.suse.cz>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0263.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::16) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO3P265MB2121:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d0c7f1-88a5-4901-940e-08dafa35e21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CDaMijWSZvXYx0c9vmbfZaLZBXzAPMPUx4AxjCWANUu5vy/rIIwgZoUekprvby8LPYDUjuYLkBytPxKsBzKf8+WiOI64EJ/p+vFddfMdogdDbz0rReDI0vgIbe7BTYKiBIyJQwAQW40H9ThokBg6dZ5DtsVK1Rafn2ssN83U3jCt5qE2oFdUEGLL/idPCdKOxm8USTRtAzo2gYKIC2YDf7zKiytZPRpS4ZgqAdqOrL3KrV68ss7AcNBaxAYxLQjBweskD55FmRqLudOAN8fxvgDHRUfJtIs0Nr+XgrtN/wO0vzWjyWr63QcXZHAtS+bB0FTiSgml32280Jg61jd1Dj6DSPbwKGVfHK0fysUAogYQivMRDRyhWsFskyU3QVxTYm0TSYqD4Shk+IUSurWSNTrSvtvI94mjaL9rU4PMprZmlkFiXNdBBphJP4swo+g0g+gP4ZENZ/PCZVe2SCRd+/mb/lpDKbUosHum6sy+jOcvRvKXvRTdVFIMSuKhZLv6dqJU/EyB3lohWGNg+hTMEHyWTQanuyaQmUGAhXGXkwC+RImGXhYdYWEEzmSOwuftpOT18lgRMpizjjxwUGsCBwCw8i0EOXJ+rjCmaQI4E6lLPIXNDn+9f1NWI0HKBpdbG0Wq9ofqIPzY9li6sXo9JA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(346002)(396003)(376002)(39830400003)(451199015)(316002)(6506007)(38100700002)(54906003)(2906002)(2616005)(6666004)(1076003)(66556008)(66476007)(66946007)(26005)(4326008)(6512007)(478600001)(6916009)(8676002)(8936002)(7416002)(186003)(5660300002)(36756003)(86362001)(41300700001)(4744005)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?cWZJQUs3NDdSMXoyMS9BbW5BK0xnQW1WWkNqRFU4NHA3dkR2NHJKOEhrRmNv?=
 =?utf-8?B?Mm14bG5rTUtBN2VYbGpBQ25VT3k0bEtNV2NFanAzeFk3WDJzZU9EeWJ3V1Zw?=
 =?utf-8?B?Q2x1eEdIQit4K2NMUGV3VlRndkRHZmpMOU55T0IvTmNwSUJ4eWZ4V09FT1RU?=
 =?utf-8?B?bUhsbFdaWGp4aTQyY1Z2UWx2QWNnbFNjS1FiRWJCT1E4MXdkVTVjeUtmK3JW?=
 =?utf-8?B?VDBXNTdzNHpRSWJUejN6K1U4b003RXB2UmJ4WmFmaE5CK0Rxa2g4QjMyQnpR?=
 =?utf-8?B?NDluNVdseTFheHk3Q2dTdmdVKzZaMGJhZExjOGxmTmM4UWVTS3NrRURkRC9t?=
 =?utf-8?B?dFdWSjBCTjlTbC9kYjNDUE91Rm9XS05oMEV2VGNnOC8vK2VnbFpqakFicUta?=
 =?utf-8?B?VUxLWDlMVjBsdGVqSTIzZWRDQURMeTRLVHFVaytrbkNacEg4RUJRbWNxUURo?=
 =?utf-8?B?NFB5Vy9zNGdXWXRGNnc0bmpsZit3dEduak4rUFlTa0p1OW5jK1VSWEZ6MXlB?=
 =?utf-8?B?ZUFqV3VuOWtLejM0UEJqOHd6VU9XYU93c0tVUTFQanBPeklIR1FVeWFTay9s?=
 =?utf-8?B?Y3V2SlBaWHBrNWVCVkdUSDJlVzVzeGdyU285b2w2aG81Z3lRdlJFaUF1cmhV?=
 =?utf-8?B?cllsTk84MlQxLzNnOG5lSzlOSjN1TzJYK2gyRkZVeTdpTEhDcFlKTzN6ZHp2?=
 =?utf-8?B?REZIWGZDMG1yek1mWEY4V3p2ZzFyQTJpQ29HZmd0YkRXWHhMdEdoWVozZ3J0?=
 =?utf-8?B?NDJFd1BRSTdxVi9WL2RXTFlLOWF3MWxGWFRFRWJmUS9HWk9vQkxRRnI4TXdB?=
 =?utf-8?B?TFpiQUVIaVZRRDl4WTM2VWdZdkpxaCszVE5YZmhERHNGdm9NR1R2WkdFekx3?=
 =?utf-8?B?dnNQRmFJcGNJWW16SjI1bjd6dElhUXVzcjFXNVRkanBHNmk1TTdyTDVrSHc0?=
 =?utf-8?B?OHE3V3lHYnliNWNoanAzYUttUkx0ZXJvYlI0SGd0clhDdlMvekM1cDZkdHY3?=
 =?utf-8?B?cVEza056cktXbmQ2U2VLVXJ6MXM0L0RUd3Y2RXd4QUQrc0l0bHU2cnBUZFgr?=
 =?utf-8?B?bWFwbTdhYmxNeC95ZWkwRmZXaElQOVBzaFUwQmdHakZlZmV0MzdSZE5GZUNO?=
 =?utf-8?B?N0RzZ1d4WVpyMXVpZkdlZi8vd3cwMTY2WS9KVUlBZlo2TVY0TFR2bTczOGtH?=
 =?utf-8?B?TWVaZUZ5Z201Z1ZtS2lubEpWVGVaSktZVWk3dFduL2tQd1Zxemc0a3BCUzcx?=
 =?utf-8?B?Nmw0N0RXM0hVTzJmL2lkUkkzdUpNbVhFbWpaa1RtaUsxak5lUGlJM2txQ0xU?=
 =?utf-8?B?a1JXeE9IUW9XM1pKVTRGQjFUeWgzNW9MYytlWk5MSDJld3BFTEhNQTJsOExC?=
 =?utf-8?B?TTcwaGR3SG42NVdnODRGTExnUlVocUFOOUJhVFhjeVlQTEtMclNkT01BMXFJ?=
 =?utf-8?B?Z0Y0YW1YSjBmMGtQL2M3NytZVlE5L1ZQNmZpb00xU2lPdTJiMGNqcmRYRGNW?=
 =?utf-8?B?SlVRajdOZ2lsY1FQeGhHb3dvVXZ3a0ZEZkpEYlhWWTFHbElndXQ4amVYSmFo?=
 =?utf-8?B?OEZ4Rmp6R29sSW5pVWJtdmdUQWhkdzhZWExUYkc3NE9lRXVsbGViakZTSXJi?=
 =?utf-8?B?TlF1dFRZTEVnaFdDMUxWQUF2YTVYRnF0Mng4dFRyMStwMkxZSXQxSmlwcExn?=
 =?utf-8?B?NURFdXFIWHBDdk41cnVuaVpmNFFyOURPaVBpYmFWMU4wL0hpM2ltaFM4VmZk?=
 =?utf-8?B?T3dZNWgyQkszV1BwcmR5L2lOYW04Z0U0bElDZERxNzV2M3hxck92MWhySHdE?=
 =?utf-8?B?aWsveUZFTTB5VkY0SGZRdi8zMFJyR2xTUEVnNVhKZnlWQmZFM012ZUhTS1Ro?=
 =?utf-8?B?M1FFU1pTZUxBZ0lUTFJnbVZUK2kzTTJ4QkRiQStnZUFsZjJId0xiTUJZSU1h?=
 =?utf-8?B?WjFMU3V4NEwvS3I1ZXlva3dmK0JsVmpCajk1djMwVDFzRDJMRXpiZFl0Q29W?=
 =?utf-8?B?WThvV2VVcTBPS2xldUVwczRoK3V6M1R3aGFmUlRmdWtVdTVFRitwTHpiTGpM?=
 =?utf-8?B?YkE1NklvcEpTNWhDZkFoeGpSd0xWdHpRQklmZWJKaEd2ZVY2UkFuektGRzlH?=
 =?utf-8?Q?EgjNG4rjpcoYHCdE/87hFFofn?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d0c7f1-88a5-4901-940e-08dafa35e21e
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 15:57:36.1930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ux8dbOhukzNnyC8FDBADwBe/1FYhDU2U8xXo/Ogjgxub8Yq6yFSnr49SfjWD1te7M4EdSyr2kqo9g9spEiH9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2121
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
Cc: Nathan Chancellor <nathan@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, Kees Cook <keescook@chromium.org>, rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Masahiro Yamada <masahiroy@kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>, Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Julia Lawall <Julia.Lawall@inria.fr>, Luis Chamberlain <mcgrof@kernel.org>, Joel Stanley <joel@jms.id.au>, Alex Gaynor <alex.gaynor@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, Boqun Feng <boqun.feng@gmail.com>, linux-modules@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Jan 2023 16:18:57 +0100
Michal Such=C3=A1nek <msuchanek@suse.de> wrote:

> On Thu, Jan 19, 2023 at 03:09:36PM +0000, Gary Guo wrote:
> > On Tue, 17 Jan 2023 11:22:45 -0800
> > Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> >  =20
> > > And the additional 0's should compress well
> > > so I'm not sure the additional size is that much relevant here. =20
> >=20
> > I am not sure why compression is mentioned here. I don't think section
> > in .ko files are compressed. =20
>=20
> There is the option to compress the whole .ko files, and it's commonly
> used.

Hi Michal,

I am aware that there is an option but I am surprised to hear that it's
commonly used. I don't think that's enabled by default, and certainly
Debian/Ubuntu does not have it enabled.

Best,
Gary
