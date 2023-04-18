Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5936E5626
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 03:02:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0lyc3KR2z3fSv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 11:02:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e4VRzVIG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e4VRzVIG;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0lxh0ngzz3cJn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 11:01:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681779720; x=1713315720;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=h3QD7H9w7ZDrpmca6vdyVRkHLGdM4j/i1DOkL76tW+0=;
  b=e4VRzVIG3fCQLyZxKHvdh/HQngPxZ1mrdyG6hqaGqx/JFRXxa809rKYr
   UNZKU6g16Yq50Am0hnfPGGg8i29QzdCnLgSGatEFZa/vAnExI90dAPHPu
   NxLzlIyjB+45IxejzJVVpnnzyQGOX1fXd34jYAIYWqfubmeFmHykhpYTV
   N5eHIT3R8q5cnCVR9iFECfq12YwsnUv+Xqs8Luki3Do1D49eGz4MnIR3f
   DWYUu70rmtqQ6Ltm+EUPHv3cdg1VeBRK5RYWuNWJZBB/1A7DZeVKkxucc
   m8brlMvySn75KpLvgSHG4g3Grjyiqmhe6KnwcCtHdBrX5fQ1ljobxcqFB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347792565"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="347792565"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 18:01:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="721331616"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="721331616"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 17 Apr 2023 18:01:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 18:01:48 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 17 Apr 2023 18:01:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 17 Apr 2023 18:01:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 17 Apr 2023 18:01:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDldOB3qy84pYEdBLAZhuH9mOkOrFTuGobPm9CDGuItNOcZ86hVUnpDEH9Sb4TfXevHsx119nRyYltNQgihz3MXJKlGglbOroy6rohjqs1ynWvmD/znUfLKd+w11PkwLxEw7x4T3fiRHiWNW2RYyqLsSEUhVN4D8cRjVYGPQCd8o71Bkqb7GC7GDG5ckEBtxoxiNRvoNorPxD+I9lY/Ksq5d/TFUC76KaP9iBpIvq125QtFNcCb5zltfru/+qJs1kmUvUOcWqUrz6uw6QScdVXotc+a+IqEav6JfhPa1hL7uN2sZrtvVePdz5D+r2aZx8z2zzW2MSghqRTR5uA9N+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNeVTnDVZOyFBfALoqiUZtD3iDQco5BngpjToU5SLKw=;
 b=OaCa23HAcyI9P/GSx+s9viPxXVtZfWjUCnX9BALyhgUuhWUgU2/p/yzAh3mNTA8NbKoDrCYp0+vPVQ3dimdz2wdFF0iI7VunNDsSUGfFiHXG8BbM8G7TRLx9ARDX02xvjqT+xiir4YUKDBDIb7emWk+a7RJIC9Mh1l57Xw2Y68OCMqqwBPvOKjIE8cNi/KxRksk+pY9b/NlLvEfVoetVClbiWvD2tS5MmYtxvJROHkURbGG6F/7+UTkAheOZWiF28mfIaIRZ9S7QB9CunZQGVIiKHhAqZ6KZ85bUaVxtyQdg4ojtdxzpF6oazdHu6bUxyS89xOGIeACVO3tzGQEWJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 01:01:46 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ffa1:410b:20b3:6233]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::ffa1:410b:20b3:6233%6]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 01:01:45 +0000
Date: Mon, 17 Apr 2023 18:01:41 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Terry Bowman <terry.bowman@amd.com>, <alison.schofield@intel.com>,
	<vishal.l.verma@intel.com>, <ira.weiny@intel.com>, <bwidawsk@kernel.org>,
	<dan.j.williams@intel.com>, <dave.jiang@intel.com>,
	<Jonathan.Cameron@huawei.com>, <linux-cxl@vger.kernel.org>
Subject: RE: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <643debf5af445_1b66294f4@dwillia2-xfh.jf.intel.com.notmuch>
References: <20230411180302.2678736-1-terry.bowman@amd.com>
 <20230411180302.2678736-6-terry.bowman@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230411180302.2678736-6-terry.bowman@amd.com>
X-ClientProxiedBy: SJ0PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9eb49e-2a8b-4cf2-1523-08db3fa87a70
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 17blPaNaXK+czHRbfmu1Xe6XgPa6l47+v+X+6jWgfBJE/7fLTO4rPatNw4w9Rfgld0NWBZQ6QQE3qi2I/L8yawC4LXH29oBE2pL3oCee7SYNOG+0WdrM2296qpexC34Pgeoqvdht4CgXL/KK/SljFttwOceB4koOL6xMpF2V6Sm4BeuvwEMz335Y1vyMOJovy2VVvwZZp9KgYdwsYQgoF3/3BiL/Knf7rRTXXU3vNi/349QQTSP2fMQQ2nRuYd+YHnLHiXFL/B3Az8YyCENLElD9JkfX2udq3hw+hQ7R0K8uuMN/RQlVvE/ZLUilHfzUPyLOrrD45nnt0z1++DbfXOkBzDTcS6Ql78lotStl+yW3Pzx3SeCCmHoYWGzgklG0q3v7m6DJcDMoWPHXjaZUFLvwm1ooIPGXLVHfT+Iu5OJKGYPA9B4AmL1Yha547PT697DxDpcMO3MkOKPD3zE8+QXs4H1VSObCorqIpdgxYEzImp3NaA8oJttIEDX0AjyUjtB7+ryvUi5ZK/g4PW5Su+L6uj+xiFgb5+o9HRYENEM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(478600001)(6666004)(38100700002)(8936002)(8676002)(316002)(82960400001)(41300700001)(4326008)(66556008)(66946007)(54906003)(66476007)(186003)(2906002)(6512007)(26005)(9686003)(6506007)(86362001)(83380400001)(5660300002)(966005)(6486002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sMp2OC46QjlUjk4B5ZZjDpP9HzcwodS52KB9E3Wf2eNcnb0xU6I+8CKbaheu?=
 =?us-ascii?Q?A06EtM9Wh5JNEKQ0KqnVgRQI9ScE+0ZW67QSlwMHPCl732arbzJFR/YLF+oO?=
 =?us-ascii?Q?fjIEqAiIzfU9ta6dReZSSHfLYw13BLISP517U0d/6KLpTsapZnE8BoaYC10i?=
 =?us-ascii?Q?g7Gvrbv/QfP7ylXu3k+RZzeK7Qddikovh5PSUsT7nlk4nvRigOI55PAL5aYG?=
 =?us-ascii?Q?0W5DDrUwSdwuBxsyA3j+pRNgGJB3M1KwjXT5dfJi1a0HeeOl5tX1SI6N4iW9?=
 =?us-ascii?Q?NlDsid+1T9t4AKyVPIm1HSV1KQ4HsBW8jVsSRHbkxrqsGJdEADOTd5kvkQa8?=
 =?us-ascii?Q?R+XKwZV+JQLEY84zrpfBM4dUTYZuMEouoK29c3szbmDad9UvkAkybfgXsZh5?=
 =?us-ascii?Q?bKl2mQs2drml/+g1zaE2naFYQMwppOQermBhmdac0aHBo8lVdLNWUCPFkrAv?=
 =?us-ascii?Q?bfYZlQN7u/id4dJj5hfDzX/F1I8AwfEolUBmXdS/JwVJOs0TGJ+cQsCikSKx?=
 =?us-ascii?Q?Zec1NnIxSwmJoImVEcrG6AK4HZcKbOv4WKJ3/8/QzQRz/LQsgyY4uP2yXqtO?=
 =?us-ascii?Q?71xVUid+cHAjXWpqnnE3YhS/qv9gdcStfxlAOuFDKXo287DUZFxF8X/ozvYy?=
 =?us-ascii?Q?XY/VpGG/xegg4xmNIHr6i8D5hYj4ZA5VDVbXpXSuTZ4YSxzNJIg8mpZ93rd1?=
 =?us-ascii?Q?E0R+R4fJfPXgONVxIY4YoApt68ZVR6pI0+1aABB34P8TxnVA0oQyzQj08CEo?=
 =?us-ascii?Q?zC8z7FSl31Xd+U7Cvw2bvqEI0vk9S4JHoxMeHXm46dNu4EFQ4qg2NnPsSlIe?=
 =?us-ascii?Q?esRX+W/Uy6u9xCg2twCWSx2z+vuHJPoj5QNX9jqG96QygEMrzWKnjmx3F6Du?=
 =?us-ascii?Q?IzBbjTeq3scTWoUuXXTPN0nNixZshCosCvihpjX7Idv0aGM2+90DUIbr3paU?=
 =?us-ascii?Q?0VsYXf6DCBHhVa147/4dFhjWf7isiTWJiswPz9ld/zwyo2MsmelHsZKE8ttK?=
 =?us-ascii?Q?4Z8WHPkU8blr/+qjg04V2s3v5qsE0PetKOHq5f5XZjRyz0DBoCSVnjHwJQud?=
 =?us-ascii?Q?Qfwz9sb3/3VF7Ie4poiQAWjnwM7B3fUlQvaWJ3S0rSVBD2pBziX+mmv3TRbD?=
 =?us-ascii?Q?F9aSWw8zA1k+P+YhWLahd8aEK3390oz+SQy4tAlWMfBUtnR+b4y6c11K0O7z?=
 =?us-ascii?Q?3Zw9ogkpJL+cBODSoBMG4kHuQlxcaQgxZmAedhJswweRlJZKhMxUAfUgRMBv?=
 =?us-ascii?Q?7WNy0jDQm9piJacPIPrqRuU/AMoZGoKLmsJQHBFgy/59Gb5sw+h8bYUI1k4a?=
 =?us-ascii?Q?oWWVuWxCzQoMMtaLQJRfhSNRW9ronQRPQS7tZorhjNtZbzTGLz5XZV7leUsr?=
 =?us-ascii?Q?oS0HBeO9ukkHwfHaZXdSG7JvWZv6OPM4RusyyPRWDs3o2dvYYBZCiusGclNy?=
 =?us-ascii?Q?Oqp72s9VQxqbAE5rA5axRpUmASHKEAfQJwKuhPkAiz8Fvnbn5Ln+9d9yBYhY?=
 =?us-ascii?Q?osX6wQFevQ2P9HpTEYwc+TRn867P/sMxSPtBTOqXzIbbutjPwNn+t0GKK6wF?=
 =?us-ascii?Q?KMUXnTAUkDUvYgJtyNxMJh5Y3e+JNiyml4QznJ8ZJf9DxnnQPoN6Yl0M69vJ?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9eb49e-2a8b-4cf2-1523-08db3fa87a70
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 01:01:44.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ev96aiLIEDxpjSgxUF51eoR4Znc1XOUzFEdsWqInJXgufs7XOOLLW6wlUSh/M8ymEsnMqj2zKnwk5+VTabi5KkKZXOuni8Zzznze9VVJslE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
X-OriginatorOrg: intel.com
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
Cc: rrichter@amd.com, terry.bowman@amd.com, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Terry Bowman wrote:
> From: Robert Richter <rrichter@amd.com>
> 
> In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> RCiEP, but CXL downstream and upstream ports are not enumerated and
> not visible in the PCIe hierarchy. Protocol and link errors are sent
> to an RCEC.
> 
> Restricted CXL host (RCH) downstream port-detected errors are signaled
> as internal AER errors, either Uncorrectable Internal Error (UIE) or
> Corrected Internal Errors (CIE). The error source is the id of the
> RCEC. A CXL handler must then inspect the error status in various CXL
> registers residing in the dport's component register space (CXL RAS
> cap) or the dport's RCRB (AER ext cap). [1]
> 
> Errors showing up in the RCEC's error handler must be handled and
> connected to the CXL subsystem. Implement this by forwarding the error
> to all CXL devices below the RCEC. Since the entire CXL device is
> controlled only using PCIe Configuration Space of device 0, Function
> 0, only pass it there [2]. These devices have the Memory Device class
> code set (PCI_CLASS_MEMORY_CXL, 502h) and the existing cxl_pci driver
> can implement the handler. In addition to errors directed to the CXL
> endpoint device, the handler must also inspect the CXL downstream
> port's CXL RAS and PCIe AER external capabilities that is connected to
> the device.
> 
> Since CXL downstream port errors are signaled using internal errors,
> the handler requires those errors to be unmasked. This is subject of a
> follow-on patch.
> 
> The reason for choosing this implementation is that a CXL RCEC device
> is bound to the AER port driver, but the driver does not allow it to
> register a custom specific handler to support CXL. Connecting the RCEC
> hard-wired with a CXL handler does not work, as the CXL subsystem
> might not be present all the time. The alternative to add an
> implementation to the portdrv to allow the registration of a custom
> RCEC error handler isn't worth doing it as CXL would be its only user.
> Instead, just check for an CXL RCEC and pass it down to the connected
> CXL device's error handler. With this approach the code can entirely
> be implemented in the PCIe AER driver and is independent of the CXL
> subsystem. The CXL driver only provides the handler.
> 
> [1] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
> [2] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices
> 
> Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pci@vger.kernel.org
> ---
>  drivers/pci/pcie/Kconfig |  8 ++++++
>  drivers/pci/pcie/aer.c   | 61 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
> index 228652a59f27..b0dbd864d3a3 100644
> --- a/drivers/pci/pcie/Kconfig
> +++ b/drivers/pci/pcie/Kconfig
> @@ -49,6 +49,14 @@ config PCIEAER_INJECT
>  	  gotten from:
>  	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
>  
> +config PCIEAER_CXL
> +	bool "PCI Express CXL RAS support"
> +	default y
> +	depends on PCIEAER && CXL_PCI
> +	help
> +	  This enables CXL error handling for Restricted CXL Hosts
> +	  (RCHs).
> +
>  #
>  # PCI Express ECRC
>  #
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 7a25b62d9e01..171a08fd8ebd 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -946,6 +946,65 @@ static bool find_source_device(struct pci_dev *parent,
>  	return true;
>  }
>  
> +#ifdef CONFIG_PCIEAER_CXL
> +
> +static bool is_cxl_mem_dev(struct pci_dev *dev)
> +{
> +	/*
> +	 * A CXL device is controlled only using PCIe Configuration
> +	 * Space of device 0, Function 0.
> +	 */
> +	if (dev->devfn != PCI_DEVFN(0, 0))
> +		return false;
> +
> +	/* Right now there is only a CXL.mem driver */
> +	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
> +		return false;
> +
> +	return true;
> +}

This part feels broken because most the errors of concern here are CXL
link generic and that can involve CXL.cache and CXL.mem errors on
devices that are not PCI_CLASS_MEMORY_CXL. This situation feels like it
wants formal acknowledgement in 'struct pci_dev' that CXL links ride on
top of PCIe links.

If it were not for RCRBs then the PCI core could just do:

    dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL,
                                      CXL_DVSEC_FLEXBUS_PORT);

...at bus scan time to identify devices with active CXL links. RCRBs
unfortunately make it so the link presence can not be detected until a
CXL driver is loaded to read that DVSEC out of MMIO space.

However, I still think that looks like a CXL aware driver registering a
'struct cxl_link' (for lack of a better name) object with a
corresponding PCI device. That link can indicate whether this is an RCH
topology and whether it needs to do the RCEC walk, and that registration
event can flag the RCEC has having CXL link duties to attend to on AER
events.

I suspect 'struct cxl_link' can also be used if/when we get to
incoporating CXL Reset into PCI reset handling.

> +
> +static bool is_internal_error(struct aer_err_info *info)
> +{
> +	if (info->severity == AER_CORRECTABLE)
> +		return info->status & PCI_ERR_COR_INTERNAL;
> +
> +	return info->status & PCI_ERR_UNC_INTN;
> +}
> +
> +static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info);
> +
> +static int cxl_handle_error_iter(struct pci_dev *dev, void *data)
> +{
> +	struct aer_err_info *e_info = (struct aer_err_info *)data;
> +
> +	if (!is_cxl_mem_dev(dev))
> +		return 0;


I assume this also needs to reference the RDPAS if present?

CXL 3.0 9.17.1.5 RCEC Downstream Port Association Structure (RDPAS)

> +
> +	/* pci_dev_put() in handle_error_source() */
> +	dev = pci_dev_get(dev);
> +	if (dev)
> +		handle_error_source(dev, e_info);

I went looking but missed where does handle_error_source() synchronize
against driver ->remove()?

> +
> +	return 0;
> +}
> +
> +static void cxl_handle_error(struct pci_dev *dev, struct aer_err_info *info)

Naming suggestion...

Given that the VH topology does not require this scanning and
assoication step, lets call this cxl_rch_handle_error() to make it clear
this is only here to undo the awkwardness of CXL 1.1 platforms hiding
registers from typical PCI scanning. A reference to:

CXL 3.0 9.11.8 CXL Devices Attached to an RCH

...might be useful to a future reader that wonders why the CXL RCH case
is so complicated from an AER perspective.
