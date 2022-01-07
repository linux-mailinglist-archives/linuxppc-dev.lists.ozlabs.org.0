Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 870824872D7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 06:44:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVXGD35Pmz3Wtp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 16:44:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=mimecast20200619 header.b=NR5+3djm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=mimecast20200619 header.b=NR5+3djm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=suse.com (client-ip=194.104.111.102;
 helo=de-smtp-delivery-102.mimecast.com; envelope-from=wqu@suse.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256
 header.s=mimecast20200619 header.b=NR5+3djm; 
 dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com
 header.a=rsa-sha256 header.s=mimecast20200619 header.b=NR5+3djm; 
 dkim-atps=neutral
X-Greylist: delayed 68 seconds by postgrey-1.36 at boromir;
 Fri, 07 Jan 2022 16:23:37 AEDT
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVWpd0db7z2ynD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 16:23:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1641533013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+uLY0XYI6R+LPrwdz1fmC76iiLA2yfMqWxPreldZEhs=;
 b=NR5+3djm6la5jRa8yzgZ8ePZbOBBLvw0MuFe8NsyR/xPULsoG8X1cLl2swd8mawuIEwpJ9
 /IFKNFgUlyaV2HohOMfp0ZvD0CVebDgh1m5X3kjvAD2Gl4ixkE3LC+itiBP6mLZIiUQb9r
 +cf2N8w7FtC31ZvStQnPY3brskf7oBk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1641533013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+uLY0XYI6R+LPrwdz1fmC76iiLA2yfMqWxPreldZEhs=;
 b=NR5+3djm6la5jRa8yzgZ8ePZbOBBLvw0MuFe8NsyR/xPULsoG8X1cLl2swd8mawuIEwpJ9
 /IFKNFgUlyaV2HohOMfp0ZvD0CVebDgh1m5X3kjvAD2Gl4ixkE3LC+itiBP6mLZIiUQb9r
 +cf2N8w7FtC31ZvStQnPY3brskf7oBk=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-7PFfkV6ZNru8tYCY0Yqmyg-2; Fri, 07 Jan 2022 06:22:21 +0100
X-MC-Unique: 7PFfkV6ZNru8tYCY0Yqmyg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aa9O7bMTIuImnU/fev5Q15vXoUeqf1iBdFmItm9aFUxKeEXMun5CZ+IsZ18wzUgYAfsicpWMcPvlzvrlUT2xVv6LphXpfeLdL+yVLuWTfS6dl/gaa1Y+OB9sVsPsqREUtfgE3RrcmcUHbMvB8l9BC9g9gMxzyAB38++oURRK6eqscZvtsx4lE977nlPt1FKqQ2ZUj7EndtRKFrcvKI/E63y1q31MKe95X7nPRtnFfJXB7XRunsuAAS4J8EVffe9mptXETuZVoPwRFTdmYixmjJGcPT5NjQie/wFthq4nRB9kRXpNFEijEy0DcX3lLdIglOEalBoBoFDIU4qTz8ZhMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uLY0XYI6R+LPrwdz1fmC76iiLA2yfMqWxPreldZEhs=;
 b=Sy7d15LE3hLYfx2V8kfTdH3lT5Wwngly3RepZuqGU0TL1Ab0Mf771sVTBnyEswwSb4lI92/raU3ZJSbv6Q7ocqiU9QRzJEd5C5Rx0EaRHHqb4KMhLzMcnaSlHZvsksmPZM5D5cPVD7TCTNliZcqqCNJh/FCGnerUAqMy6d+NEcoqrkjqHUGazl/Wjmm7hqI6pfoaQQE0F9kgiyb3wr5nIHT3HtSxVYZlwPGvm8L++FKe/kgnbiAyomAbr8iNvbO6AJg6OsxjSDXUpcjXZsSlHdbnFoD6b6ncS2YcXD292tNoNdmV0Yy2G9Mn5WmteyZ/foYjH3GkGN4348B7QIqPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB9PR04MB9426.eurprd04.prod.outlook.com (2603:10a6:10:36a::14)
 by DB9PR04MB9500.eurprd04.prod.outlook.com (2603:10a6:10:361::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 05:22:17 +0000
Received: from DB9PR04MB9426.eurprd04.prod.outlook.com
 ([fe80::7547:9d8a:d148:986e]) by DB9PR04MB9426.eurprd04.prod.outlook.com
 ([fe80::7547:9d8a:d148:986e%6]) with mapi id 15.20.4867.010; Fri, 7 Jan 2022
 05:22:17 +0000
Message-ID: <7fc839d7-c13d-d658-5247-62540d76e7c0@suse.com>
Date: Fri, 7 Jan 2022 13:21:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] fs: btrfs: Disable BTRFS on platforms having 256K pages
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, Qu Wenruo
 <quwenruo.btrfs@gmx.com>, Neal Gompa <ngompa13@gmail.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
 <6c7a6762-6bec-842b-70b4-4a53297687d1@gmx.com>
 <CAEg-Je9UJDJ=hvLLqQDsHijWnxh1Z1CwaLKCFm+-bLTfCFingg@mail.gmail.com>
 <db88497c-ea17-27ca-6158-2a987acb7a1c@gmx.com>
 <87bl0o2lgo.fsf@mpe.ellerman.id.au>
From: Qu Wenruo <wqu@suse.com>
In-Reply-To: <87bl0o2lgo.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0071.namprd11.prod.outlook.com
 (2603:10b6:a03:80::48) To DB9PR04MB9426.eurprd04.prod.outlook.com
 (2603:10a6:10:36a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3189ffa3-d16c-417a-6564-08d9d19dab93
X-MS-TrafficTypeDiagnostic: DB9PR04MB9500:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DB9PR04MB95001965466F181F6E4FA964D64D9@DB9PR04MB9500.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AKvvY4IR/wGsa6BPI26vOJiY8ek5Td4NDMVfUmMbITT2L0NrHNyrvNTjE+YnDrkloKT4hlYmBmgH2nsVscnvumsNtxktLpW02GMXQE2cYPUcrGl7Fni7GRDXlJsxBcL5TnpIv+aL9pEpzo4yHNQcp9IHCJ6lI3VSJ5AEX7Z0fC0jjrniJhWRx6OktoRZmy/dpGfX9lUBzGqfdAHgfsm4emcRSjSujEY8uCuJvuAQmotCA8m/lxjV64680xreUN2IAurEjvt0fWIH5zTAZLGDV2p4Ak2MAdsFYJbz2ZvvHRlgrOUj69gK8s0Zvcl0+2vWwO8k6gp/uiIqhAdxQ6DiLWyuMIfQUoQpiy2G494UARpopZBgih8riXQNWxuxnsg/GkxRn9Ff1R7SdbMAuqs7ScrjnNOg8QKgQOM6x7Cy7KlX4rvBq7ltYXfL9uKsuCIYqr2sEpyi2ISsLKrK0RuzbRaulq5EDCZnOMLQffBSkDQ0jrpq6TtyGgzBOa436cqonjIzJhF7pPtLTFaDeHX48a7vue53tukaipdeRWwCT/kkOtR75Nm8WaWSRq8AQ51voajI3gsyQtHMHVRwfgqERuL6CPPXEmK7RJ9eqv9Xflxl8BOnPVCIoXe/P3G0en1+rDg8JQ9zM46gyk1/6Y9te8k8eCTRaaH4qULRsIgn30BkZtqfJJtQKI5QtZQgPgUo5ERxX7jVZFiydoHhsnqls43yH/M97+Gh62hc0yFi0kZVcLS+Ziavf9GzVMbRuZDU8og95IaCP+lb4oY8b/d08Vg8JDnNDs1QYZAi53Ql8mlxPAY3PMMf1bhwaByrk8HynIJ8ahpUGem2BZGbBzTtWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9426.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38100700002)(66946007)(66476007)(6506007)(6512007)(31686004)(8936002)(2616005)(66556008)(7416002)(8676002)(6486002)(83380400001)(4326008)(966005)(54906003)(2906002)(53546011)(110136005)(26005)(316002)(31696002)(508600001)(86362001)(36756003)(6666004)(5660300002)(186003)(518174003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3gzcjNNL1JNdDJaRGNNWGFGWkNoTmxvWDJuS0Q1UmUrZ1E2MjVDcDNBZjhN?=
 =?utf-8?B?cVRuLzFmWWlrcHlNQXB2YTRUZEE1S1J0VmxJdkpYV1Z3dlFRazlkdEpBcmZv?=
 =?utf-8?B?RS9qaFBzMVVsSkRETisvSUJ3ck01QnZOL29FTTk1VCtJOTJLNnhqOVJQejZG?=
 =?utf-8?B?THlRWVBldmxHbys3Vk0yZVp6UVFPTEZjVjRoVE50Rk9ZNWpPdVhjK2Q5L0Ez?=
 =?utf-8?B?WjVLVWN3bitpeVRHM0lFWWlpL21HUFZjQUp4b2FJV2RYYm45MUhTSFpUdUtT?=
 =?utf-8?B?ekR6UGdTMW9sM1laSXhvQU1jQ3EyNW1nejNkQkRMZ3pVaWIvODMyV2xlZE9h?=
 =?utf-8?B?MzZwSldHbGVSUkp0cGlLYUtXT0tXU25yYkh5NmgrY1MwT0U0UkdTcW1QWXA3?=
 =?utf-8?B?czlwSk8vd044NlFwOFZHcFMxWnA2ZHZWak9UaU1oYTErL0J4djcwZENPTVBD?=
 =?utf-8?B?TG44ZWFXZ0dFVzBXM0tMMVh3QlF6RXgxWnhybk5WQkJyek9FZHhmZ3Y1Qzhj?=
 =?utf-8?B?Z2gxUlVoTzJ6bWxjejU0c0k2WThhYWlOS095Q25FdVZ2Y2hjTDFOeVQrb1dt?=
 =?utf-8?B?cjErUllwcldmQmZramcxaUhyTEpoWVdzTHMyNEdNZ2tRajg2c2RDYTg4VjVr?=
 =?utf-8?B?YmhwVGFIUVRialVBcnRsa0VmV084WEFuWXR0NmUwSzVVYlNHQ0NhKzFvUXUv?=
 =?utf-8?B?K01iTnlmWWxLdWwyeVkvZ3YvTzI3d1czUUxpV21FblliR2NjdjNKWExPWTh4?=
 =?utf-8?B?NWdYSkZWYUhMRkNXWlJnQjFQMnRPeGhNWW9qOTFpb2NoODYwQnp0RUdZclVt?=
 =?utf-8?B?K0tmcE1aamgzMnQ5YlZvZm5PMVhzZi9zV01JdE9KSzZvVnQ4cHVRSGhUNlRM?=
 =?utf-8?B?bnZKYWM5UzVrQzNjQzNQb0RwaDdVSkxCNnBSRzMwZVoydkdkSUo5bHVNSjVn?=
 =?utf-8?B?U0ZNc2tTc3NQeEIzeGtxakxEVE0vT3o2bzlwTWNzUncvTVF2NS9zMm1PRzJv?=
 =?utf-8?B?TjVJa1hMWTVPSUtpUllZZytBSHBlMUxqQzNTTEdVczdkVGtXd2w4K29nckhj?=
 =?utf-8?B?bmhuK1RCZzA4OXJHTUkza2hEWmRIeEs4emZ2K3ByOUdOM2N2S01FOVV4YzB0?=
 =?utf-8?B?M1JQaStqTjJySG9LcTJxZTJtRjczN3ZBOEY1YTFqQWFtL3E0bFcwK3U3M3hH?=
 =?utf-8?B?MndtWCtSY2JqOWY2bG1mV0M2eGsvVndhSzBMSEwzMmxTZ2NKZ3VYT0d4WUlt?=
 =?utf-8?B?M1doaWdNT3ptekxpdGI4d1NnSXRrRUFULzZVTVJ0NzVmS1FtWDhqV2h0cHRK?=
 =?utf-8?B?ZUJTQUdJQjJsZE91TU9GckorNWFnZjdpMTRFcGZpK3R3Z2FpNXFqbnZlcGVr?=
 =?utf-8?B?c3VGM1NqL2h5ZmM3S2JpWlZoS2czRUJJek9rWlJzNVhwRlhLcHpRM1N1WnIw?=
 =?utf-8?B?OHpyYTFIeFpva016Umtybnp3NitSaWNia3VmTHFjUkdkTndDSjN1WTdMR2ky?=
 =?utf-8?B?QWNJckdnSnBhZGh3ZU12UEszR0YzbEdoT3pITzFiNmhXZkN3cUNEcFpOU2ZV?=
 =?utf-8?B?SEZLMWpteEtBSzNFWlhKMmpJeHlXRy9ZaFM3UUNnV2NGYzU0bXdOdFJyTG85?=
 =?utf-8?B?aHB4ZEFtVWVldzF6bkVES054clVDdDEyUXVVQjlKV2dTTHRuMzR0c3o4aFpE?=
 =?utf-8?B?SzJxVnAyREZLVFl2T2QrMW5ZejIxL1Z1M0kwMUJkbmdaMzhqQ280cXZBRWU4?=
 =?utf-8?B?Unh0WHRnMFBrTjNkakErSzBvUFFxZFZXYTlGa1BnQ0NNdWJLWFJQbG9FODVC?=
 =?utf-8?B?YWkrK3dqcUVTT0Z6dUNMNHdibkRaSmJXVmJxTGppL3JROS8rd3E1ZjBiRita?=
 =?utf-8?B?M3B5dWd2Z0s2TTlQcURQZkZIZGVKZFhQMlJ1NXU5TkYzejQrNU1kdEJ5emZZ?=
 =?utf-8?B?TFA0N3FyRW5UREZTMFFaWlNGRlRCNyt4RmRHcVNVVjZ3Zkp1SzZwc3hRalo1?=
 =?utf-8?B?cEJXdW0zY0xPT0s0QVRvbDlsM09LZDNwQ0NkMTM5WWZBYVJEOGRzNnd2WnZ1?=
 =?utf-8?B?dEs0LzN0bkVpUWN3N0tNZ2ozRTY2a3VXRnRvTkwxcjZZU2pVcHp1WUtvaXV1?=
 =?utf-8?Q?yc/0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3189ffa3-d16c-417a-6564-08d9d19dab93
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9426.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 05:22:17.0301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4biJCwCjadlE7qzJdosCWS6Ny3BSPDHHTBZoFCJUQ7V3VZjjCMRRhSIoVhWMFuxi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9500
X-Mailman-Approved-At: Fri, 07 Jan 2022 16:43:24 +1100
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
Cc: linux-hexagon@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linuxppc-dev@lists.ozlabs.org, Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2022/1/7 12:55, Michael Ellerman wrote:
> Qu Wenruo <quwenruo.btrfs@gmx.com> writes:
>> On 2022/1/7 00:31, Neal Gompa wrote:
>>> On Wed, Jan 5, 2022 at 7:05 AM Qu Wenruo <quwenruo.btrfs@gmx.com> wrote:
>>>>
>>>> Hi Christophe,
>>>>
>>>> I'm recently enhancing the subpage support for btrfs, and my current
>>>> branch should solve the problem for btrfs to support larger page sizes.
>>>>
>>>> But unfortunately my current test environment can only provide page size
>>>> with 64K or 4K, no 16K or 128K/256K support.
>>>>
>>>> Mind to test my new branch on 128K page size systems?
>>>> (256K page size support is still lacking though, which will be addressed
>>>> in the future)
>>>>
>>>> https://github.com/adam900710/linux/tree/metadata_subpage_switch
>>>>
>>>
>>> The Linux Asahi folks have a 16K page environment (M1 Macs)...
>>
>> Su Yue kindly helped me testing 16K page size, and it's pretty OK there.
>>
>> So I'm not that concerned.
>>
>> It's 128K page size that I'm a little concerned, and I have not machine
>> supporting that large page size to do the test.
> 
> Did Christophe say he had a 128K system to test on?
> 
> In mainline powerpc only supports 4K/16K/64K/256K.
> 
> AFAIK there's no arch with 128K page size support, but that's only based
> on some grepping, maybe it's hidden somewhere.

My bad, I thought there would be 128K since there is 256K and 64K 
support, but that's totally wrong.

I'll get PPC guys informed when the 256K page size problem is solved, 
and then ask for your help.

Thanks,
Qu

> 
> cheers
> 

