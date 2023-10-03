Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6467B712F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:40:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cEXs0C/L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0RTg5ZmNz3w0L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:40:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cEXs0C/L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mgamail.intel.com; envelope-from=sohil.mehta@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0R411CxQz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 05:21:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696357313; x=1727893313;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7oKKf9wStDYbZ/NEty51zTPtDYrBegjyYgNv6LrOOXA=;
  b=cEXs0C/L+lMkUh9dOz11t+vMewTffPNeMThRARaEzgePeC/2yVI3NZG0
   Wg0QEEhIn08hPa/W8zIaherXuRosaxP+Y85BgROJoqE918PU+mlJD8Gvb
   2Elw72u7nfUEJV0+3i3eriJWmfgzYoWFcMd03uAiU0rBj6ckjXELOb5Hj
   r5wlf/6H4qFtksGzGnt1u/I++RQGD0mbygv4nD7yMN1ekgN+j/xAc5Pza
   QyYGZKO7iBh74jxWrVEISDl9cYONK2AWhwM5o69fusoEvQ20syqXvaFLu
   +m/jYNfrXyhktZl6RzMFLCJVsP8b1Lx5fnJXKP3lTF3VIZz5hMe15HQ8P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="381819814"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="381819814"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 11:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="754547121"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="754547121"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Oct 2023 11:21:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 11:21:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 11:21:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 11:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0+/E7DtERhUJ/MXLxqTwkD1pjkkKyKpaZo3ExQ6CCNggW5l0jZMdxZLfFYg5MwMVrqWc0MKV6cM/rfedKuU2I9PAYc9WJ8vJPAtSRwVYqdV60rEvV9ThKGUmUQ4UrJUgsG8XKcOCMiKDWOWiu6qA/CVwdwkzmP0/qhYtnWcT1vROAAspfTOGmhsyQoI5vq3MNFHKYuCTQ/qQYI6r9ts5DhIfaECwOArloMql/58lGmdIrM+av+6AY6jceBXizqgnvxNQA3JGm0GHaLXH7ZkfDciN/nDH33KE82ipCcF9eWGvhE8qAw+LKmqqlh2GKv/kG72Fdwaf+Df1hzW/Gd+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3L9KYCNjFEswnoGrgnzZKwGg1ekcHIguei2I/Xqd7yI=;
 b=PIgaEpwNbWWvhafhczP731YcffEuwKIV9SbMmbwwA1hJTSOqrSows3GiGXKg0mY0fOOjmMI+LJmJevaoICGbpBibn35fwWROZr82XAJmVTPfkSeiLI8HyfbFWjli10lcRw5EJQUeJ+bUi1QM8Q4qFVKIBrk/PMVSfA2DV0AX5LG1Z8/wIPqDxlkt7TBqx+6u6+1IEb5n45yeWDh2+LtavXtxQ8j3WlWoAPG+EqYu//xTD+pGtOZ5+CNDc0brc2/ceufiPOamLvrwx4g+x6bVzJLTvWa+MnPuTbGZ/gvn84ivb5i3XSsrWLZhLhJqnjoJO8iNnjsRSKYIQi1kKaKLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Tue, 3 Oct
 2023 18:21:37 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::5e34:ee45:c5e8:59d0]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::5e34:ee45:c5e8:59d0%7]) with mapi id 15.20.6838.028; Tue, 3 Oct 2023
 18:21:36 +0000
Message-ID: <0af98e18-718a-38e2-20b3-6eb22b1ebabe@intel.com>
Date: Tue, 3 Oct 2023 11:21:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] syscalls: Cleanup references to sys_lookup_dcookie()
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, <linux-api@vger.kernel.org>, Linux-Arch
	<linux-arch@vger.kernel.org>
References: <20230628230935.1196180-1-sohil.mehta@intel.com>
 <20230710185124.3848462-1-sohil.mehta@intel.com>
 <5748f659-4063-0e18-c5d4-941a863d0d93@intel.com>
 <cdada842-2a7e-5f1d-eea3-3d99b637c26b@intel.com>
 <ac03a633-5d74-4735-a7bb-0214f54242c9@app.fastmail.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <ac03a633-5d74-4735-a7bb-0214f54242c9@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d55efc-729a-4fff-d14e-08dbc43d9489
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JKjQq76201tigN9ATrU8QWEIyFvpi5QsyPjdWcGY3UbG76rBrvxDnu1dnWdaZvpUoBBlBku9ydxVwvk8dkvyZqa9PwCoUGxKH5hQLjWn1FRdi6wuMQckv0jK8aXHBkQu8fJBT7OFxWs4fdyKauvenaz2dCzO+osHjuPgKlKcjbd+S81+sHHFd63Y62+tkv63wT+tKfmi2ui5OkoKBuvIfcLClkwnfpIgXXsWnJgUrvgIdt/eXQkKWxwrMeA7gZmRfpxBsWJ+3Fof9vJSmM/PoAfytNCG7Pyaa9wt+duAjdpEmbCFGtyk3lCP3gUYvh/3fBiT/iLvo00JM+mclmjMdUjrsAQBhfZT9UjaIRfa1lchHfZT7sVk7C5OxmE7Bk/oj1pfehHryKaiiSMeldQzcJolC73BmtHBYl05zqsn53NtIfeFPXDs++HgrCpEfN8Aenj17dGi/rz6l36t5/SwimeM0MdjtjSuzYRvysyP27umuY4u8/OnUyzk2Vg/Lr4zZOFDouTEJr3aYIILhzezuhhEYUJrXNoln7S0js6fELV1Uj7ppkctbufy3gqkLsTCtpjns6ufVWatSsOJDzPWq0meOUsnMxnFhUR0vFSeEBjYSCTIU6d1wP2MRYjHvOBODvWJqp0gSptnuWpubpWSUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(396003)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66476007)(66556008)(54906003)(66946007)(26005)(110136005)(6512007)(36756003)(83380400001)(38100700002)(6666004)(82960400001)(558084003)(86362001)(31696002)(53546011)(6486002)(316002)(2616005)(478600001)(6506007)(7416002)(7366002)(7406005)(2906002)(31686004)(4326008)(8936002)(8676002)(41300700001)(5660300002)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFBVamFiRm5adVFnTldXUjhBU1QvRFExZ2tubFlpTFIxQVBkZG9ENHB1ZVlo?=
 =?utf-8?B?Mis2TTZnakdmNmxYQ01XTVlqY3ZHaWY2N3F3bG9jUGRBaWR6WTEwTFRKOHlJ?=
 =?utf-8?B?YzJnV3R1dE0wV3k2TFhSSE01ZEF6RHJ2cGhmMjJ3YlZVR3cwRHorTnJlNElG?=
 =?utf-8?B?ZWFpdXZObElyNXdUbDlFeTNwa0xXdXhDbkxiVlc3d1FVNVBYVGloZis2SU1P?=
 =?utf-8?B?SUtvdVRiMnJtQWFUR1FuZWdJOFZiL095OVNvVG9PV1VhZ0EwazExaXJjczZT?=
 =?utf-8?B?U1V1M3ZvWEE0WDhQaUcvRE4yRWlud2lJTUxZSnhvUTFSellYZ0dvS3BQYjNL?=
 =?utf-8?B?ZTNuNllIWDQxbTJFNGZBMzg0OXlmbnFWREYwaDQ0QTVBdU93a1JUSlFrQXlr?=
 =?utf-8?B?My9mZTlmSmNyQW0rNjhuOG9KNHRRRForSDVXeS9jV3VzYlpSTmxBcFV1QnJa?=
 =?utf-8?B?Q0U2TmtnaEhWbUJsdUhUcGZLc3U1L2JETmVLWGFKVzVZa2phZnZ6VnloS0Jn?=
 =?utf-8?B?eEJJY05mSnlLL2pyRHdRaWt4VzdOcVV4NEZtd0hQTWJiT2prODdoSmxhUEIz?=
 =?utf-8?B?d25OVnFWeXVQSDN6SkJXM1pLdjBRK1luR25vV24zTHg5d1AzOXRQQ1VWTGQ1?=
 =?utf-8?B?K2NtZWRCTHgzcDNBTEowVEpYNjhZQWFyWmxaWWZOMGtkbllGaGh0MUtyRjdI?=
 =?utf-8?B?UTZaTDByWDVPcmpMRUN2QjN6YjV3OFYzWWxYYmRlQ1N3bG1tZk95OGsrZEJE?=
 =?utf-8?B?NVNRM1lzSWJqaUVZQTFoWWZXMVR5ZHhxVC8xNFBTVG5DRmtqc2VzUGNUME1V?=
 =?utf-8?B?VTlEcmhYa1Vya0JvMWk3N3QycXpjRjlTbmhFZWlDWXVhVHRGWVBMTW53Mklp?=
 =?utf-8?B?RTdyeHVlUEJMVnpuTGQzMWJhL0NPSjZnY0NuRGp3YlVWMVpDVElQT3lzS0g5?=
 =?utf-8?B?dW1BbFhFb1c3SlhhVnZoYngyMWZxV2FReEZSS2M4MXZaVmlGeXRiQ2tPbkkv?=
 =?utf-8?B?bnBGRks5eDdvcnZNNjRTSVk4cWRxakdEcy9IWTRQOHVyaVQ1cytoMnlhaisx?=
 =?utf-8?B?dkt4YXFacklseENPTkhDRzcwd1dXTDBReURYZ0NkaWRFVHJhVzBBaDhpdnM1?=
 =?utf-8?B?TWFPTzVXVWljaS9KcWRrRlRsT01RZ1ZpUkx0VHc2bHVTM3JrUFZDb3BtUmRi?=
 =?utf-8?B?MTN0c3Q4VEZLL1I1Q0p2YVRkMGR4RVE4aTRMdnkvM2VGWEpESjQ3WWpHVjdU?=
 =?utf-8?B?M0cxWkNVWHBQdlp2NkdmKzJac2ZSZk9CNDZTanlEM2ZDZGJ6a2VteHFGVkdT?=
 =?utf-8?B?aExaL0FnME52VUZKNkFDeEloQ2xkbVNzNWV1dE45WUlnZWx4WFZJWWljSnlF?=
 =?utf-8?B?V2R3K0RhdnFwTjMzMnczK3N2Y0FRTlVNVDNzdm5hbnNWcWs2TitybEdhajgr?=
 =?utf-8?B?LzRtek83d3RxZnJ3QmVhZzNnc1pTTjd4NGtSWmlIWFhKT0tYY0xjaUx2VDc5?=
 =?utf-8?B?c0VOMnRGMHlDRGo2MXIrOGZZM25rS25SZ091R2plZi9yam11cEFURWRaR0Zs?=
 =?utf-8?B?NVZEY2dRTjhhblhzTjcrOEc3UFQybmFZaXpFOXdtVFV4M0taeHNiMDBZTzhr?=
 =?utf-8?B?NTZnRzJZdFFzVWVBVkRPakRJTC9BVnZ1Q0JvaWpxdGFtbjFYQWxwZmU4Y08z?=
 =?utf-8?B?elNaL0VJQ0R1cFZiTVoxWnpUbnA2YzVDSXBOL3ZadTcxejRtWERCVFRXWlZ5?=
 =?utf-8?B?NFlNSzZkcHAvdVJMd05GS1JqdDhHVjZHWHRaYTYzUTBjSnorblI0TlFLMmRE?=
 =?utf-8?B?UU44eTluU01iMDg0WUJoVnFQVVhNdUF2NmRsbCtPM01UL3N0bjJGZmhKNXla?=
 =?utf-8?B?VXdyZXVEY3c1SEVlRmNNMWk1SG5NTUJVV2wzc29QcURtbkYvOXV5UDM3ZE5V?=
 =?utf-8?B?Ri9jV3VrMktIUEs1bFJXQzQrR1dQTng4dU1JaTJIZkNBa0FWSldzV0NZRSs3?=
 =?utf-8?B?MWJGSUNkY0xJclBZWlg4bzN5K0ExMjdXOGlnbXV4WnN1WXcxN0NHV1l3N0VM?=
 =?utf-8?B?MmhqR1NzSlY1UkxrYVY1QUlMTW04dGxVSWFhN0tLMTBwZ0dOY2lvRFhuSjd4?=
 =?utf-8?Q?9y/BANc7hR256Wnj8el9fWpQE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d55efc-729a-4fff-d14e-08dbc43d9489
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 18:21:36.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nESPZxay6vXiX7BD2O3E12nXGPQy5SS/4jVZaz/+XPQsyI/G+a4PUU8dudZdoDA2CsN3o59pWmGuyVASG3vZrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 04 Oct 2023 05:32:24 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will
 Deacon <will@kernel.org>, linux-s390@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Helge
 Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, Vasily Gorbik <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas
 Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Randy Dunlap <rdunlap@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/3/2023 10:53 AM, Arnd Bergmann wrote:
> Thanks a lot for the reminder, I've added it to my asm-generic
> branch for v6.7 now, it should be in linux-next tomorrow.
> 

No problem at all. Thanks for picking up the patch!

Sohil
