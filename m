Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E16861EDA01
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 02:27:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cmnN1r7gzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 10:27:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=wsJJ34pm; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cmjz6f18zDqdn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 10:24:22 +1000 (AEST)
IronPort-SDR: QKVZMvIEvM4+9zQV7m4OzUzLSQSPh8U78Jr4RDK18PleZ54zE0sfrTMK3/aualEMzbnRBZ07x0
 HUfxMzwDcY/Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 17:24:19 -0700
IronPort-SDR: 5uzinGTDbHN4KbeKaiCDSfwPW1ZsTqC+FfSWw5qi4EItbsr9kCN5Kr4d0CTndNMBmFJJ8W/Hkm
 xB6gLgBsiO0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,470,1583222400"; d="scan'208";a="312749580"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Jun 2020 17:24:19 -0700
Received: from orsmsx121.amr.corp.intel.com (10.22.225.226) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 3 Jun 2020 17:24:18 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX121.amr.corp.intel.com (10.22.225.226) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 3 Jun 2020 17:24:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 3 Jun 2020 17:24:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiAXeP8LDZmyx93JLbkVpq0gYQmhbvj/kCxDW9s/pyCke3giYISKjeKVB71SHq+waa5TwzS8y8GEtjJ6VRStF3QgFHBZbWjFnfhzl2SEYzbzrCm1LQup+tx9S4pc9O/YUppswp4EMWV5aWEX49XkWoW1Tt3V6xGjAwUkJ1YuH0p2mJGyvsh+76Y0yTGRjOqH7kkFIMCgKoX1JJp3hBN39cRK1+My+WJ6NbdHha+W2EckmJxeDRWY97R4x6EzjiIETCyH4FRabuQNyU45DZhsSHeQ34Qj3DIfmda6XlYSAEIO0UyZszW8CAtFsAyF7hTmh2fnPJej+onoGGRzKpAppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDWdAvMp+rz8sCVHlX7z6HiWPmWHl8sOwTHqoEKdihM=;
 b=cEvv4BisxHwa/DwdAaGj9Gl0HQ/+tJOeU9LL+Yt7v7GP+CSzUi5C07mJfcX4EEqgi9+Nsw+/J9rBbP1oC+mUkX7ODaVeDLOoXAyr/pkYy+PnCUfAbYT4w7gZC74XbAVMeULPhEgQcnwYkwNojRHNLyNUvWP4r0cU6Sa71NfqeNAiSkY/U4pYibvv6U4ricl7XcFIGPXU9r1vba4sQLBCAPo/Bn+RUf3tMCXyl+S1v4ANnQktOiH/JeEau8nOEpA4gLoGzTotqwXvuERh/Mvrq8b7X662RrY1T4mXJDZNiE5WrGiXg/Ze6/udj2SV0MUI46A2zvSMkpEH6bIq9CCSZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDWdAvMp+rz8sCVHlX7z6HiWPmWHl8sOwTHqoEKdihM=;
 b=wsJJ34pmmiNYv/ky9OXDp8A9T9q0w/0NQHq2XgO0Qc3sesn47jAsxXHdYfqYKgYWkODcwITRbWBlFUhWsiAqd7YHMmWFrqat4dD4pGRzwc0KBRMB2CUHQUAh5Xhz68F//IzU3m0PHKCu1yAZCZazoo2YI9ATmff1I+taVc2gTuM=
Received: from BN6PR11MB4132.namprd11.prod.outlook.com (2603:10b6:405:81::10)
 by BN6PR11MB1729.namprd11.prod.outlook.com (2603:10b6:404:101::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Thu, 4 Jun
 2020 00:24:16 +0000
Received: from BN6PR11MB4132.namprd11.prod.outlook.com
 ([fe80::2d67:42cc:d74f:6e4f]) by BN6PR11MB4132.namprd11.prod.outlook.com
 ([fe80::2d67:42cc:d74f:6e4f%7]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 00:24:16 +0000
From: "Williams, Dan J" <dan.j.williams@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-nvdimm@lists.01.org"
 <linux-nvdimm@lists.01.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [RESEND PATCH v9 4/5] ndctl/papr_scm,uapi: Add support for PAPR
 nvdimm specific methods
Thread-Topic: [RESEND PATCH v9 4/5] ndctl/papr_scm, uapi: Add support for PAPR
 nvdimm specific methods
Thread-Index: AQHWOMbZ1F4nAw1F40+DoRTylQ4OI6jHj3YQ
Date: Thu, 4 Jun 2020 00:24:16 +0000
Message-ID: <BN6PR11MB413223B333153721405DFD91C6890@BN6PR11MB4132.namprd11.prod.outlook.com>
References: <20200602101438.73929-1-vaibhav@linux.ibm.com>
 <20200602101438.73929-5-vaibhav@linux.ibm.com>
In-Reply-To: <20200602101438.73929-5-vaibhav@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aaf3b7d9-9e9f-478b-db93-08d8081d9db8
x-ms-traffictypediagnostic: BN6PR11MB1729:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB17299CDB6A05CF85E73CB03CC6890@BN6PR11MB1729.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GSdlWLc2qo+GvGSj8gautL8wEWICMo39iD91lPRz8VtkQsicFMxtaRMfe7TSf2U4O+5KWzp9DW50xXkXIn4e3+V3nq7C0xT/adP1R0ST5QHjdRvSpRDLhK1mByusN+GhEoqpV1CqWOglQ7l5bdyarJ7fX2gnBVHNd2vmMouGH/LMITQCxQueoftU5PqIu8mNstavKnTMBn/8uluF+lGsjvus3I2cbk/O93BVwBzdKA2e9dASfLxWjlPFzVBqtPuVKFxnntWIi5dTT5sTfx8ZKnniRHeYJ66+2y2dCHAM/AHHuv5csIbRY1vtgz95MrbGpxeNLFkF9AE2eHJnyDkECw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(376002)(366004)(346002)(136003)(396003)(107886003)(55016002)(9686003)(2906002)(7696005)(45080400002)(110136005)(71200400001)(4326008)(54906003)(316002)(26005)(33656002)(8676002)(66556008)(478600001)(186003)(8936002)(66946007)(6506007)(66446008)(83380400001)(5660300002)(76116006)(64756008)(86362001)(30864003)(66476007)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YWLETSPQ+oQHkf9ETBL9TKYXWS1+Pulde0J4iq87skP8Clqe4AoFINAuwYI4p0D5wZmmPNeSy/w6/zp5fHicEgCC5tr+QI/0sgKmkN3eYMKy+TDdn7R7NehAhPxB7GUFg0VTqV7TXAfvyeqOGyAuNJ0qsWMnJmeGq5U1rMTiy0itr08bRhK55w+BJ9DXRBwuZ4ovBwGWEFeWL5GF+qKj6aeFYgOCTi85LPDynjWDKyIxjwpN9xBuIzBEQHrK3Cdcn0rSbdoZUgHzf9Y2qG8j8U4yFnH+Ft1MFi9xBYwfujWyKuuJpiKLPVdMNtTPDGG6klqsDZQfL2pMQ3IRqoUUjVatEcRrMt7toOfppUg8Ej/X7Q1xOFlklmIlP7y8FOB3Q0RsRuITUEcRKCEOFYLM7Y7bdlEYPL6ZHIymrxkRqQY5IAlJ3mgQ82N6j/ip7HWZYZJ19MXCZAlQ2Cco049Tk5bPfsY4dgT/tl/rpulJEE1vccpx9IiYmvrwwzrglhoY
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf3b7d9-9e9f-478b-db93-08d8081d9db8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 00:24:16.4297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbJqh+kUZuc1h3J5c6MPd7iqZ191TNTu87uMjOxHH+/Y6wh/twhgXI5lPaUoNxfFynyt0dqIS6Hn6H0C/MJweZ4qHI6kgxj1sLyrYOQixLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1729
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Oliver O'Halloran <oohall@gmail.com>,
 "Weiny, Ira" <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ forgive formatting I'm temporarily stuck using Outlook this week... ]

> From: Vaibhav Jain <vaibhav@linux.ibm.com>
[..]
>=20
> Introduce support for PAPR NVDIMM Specific Methods (PDSM) in papr_scm
> module and add the command family NVDIMM_FAMILY_PAPR to the white
> list of NVDIMM command sets. Also advertise support for ND_CMD_CALL for
> the nvdimm command mask and implement necessary scaffolding in the
> module to handle ND_CMD_CALL ioctl and PDSM requests that we receive.
>=20
> The layout of the PDSM request as we expect from libnvdimm/libndctl is
> described in newly introduced uapi header 'papr_pdsm.h' which defines a
> new 'struct nd_pdsm_cmd_pkg' header. This header is used to communicate
> the PDSM request via member 'nd_cmd_pkg.nd_command' and size of
> payload that need to be sent/received for servicing the PDSM.
>=20
> A new function is_cmd_valid() is implemented that reads the args to
> papr_scm_ndctl() and performs sanity tests on them. A new function
> papr_scm_service_pdsm() is introduced and is called from
> papr_scm_ndctl() in case of a PDSM request is received via ND_CMD_CALL
> command from libnvdimm.
>=20
> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
>=20
> Resend:
> * Added ack from Aneesh.
>=20
> v8..v9:
> * Reduced the usage of term SCM replacing it with appropriate
>   replacement [ Dan Williams, Aneesh ]
> * Renamed 'papr_scm_pdsm.h' to 'papr_pdsm.h'
> * s/PAPR_SCM_PDSM_*/PAPR_PDSM_*/g
> * s/NVDIMM_FAMILY_PAPR_SCM/NVDIMM_FAMILY_PAPR/g
> * Minor updates to 'papr_psdm.h' to replace usage of term 'SCM'.
> * Minor update to patch description.
>=20
> v7..v8:
> * Removed the 'payload_offset' field from 'struct
>   nd_pdsm_cmd_pkg'. Instead command payload is always assumed to start
>   at 'nd_pdsm_cmd_pkg.payload'. [ Aneesh ]
> * To enable introducing new fields to 'struct nd_pdsm_cmd_pkg',
>   'reserved' field of 10-bytes is introduced. [ Aneesh ]
> * Fixed a typo in "Backward Compatibility" section of papr_scm_pdsm.h
>   [ Ira ]
>=20
> Resend:
> * None
>=20
> v6..v7 :
> * Removed the re-definitions of __packed macro from papr_scm_pdsm.h
>   [Mpe].
> * Removed the usage of __KERNEL__ macros in papr_scm_pdsm.h [Mpe].
> * Removed macros that were unused in papr_scm.c from papr_scm_pdsm.h
>   [Mpe].
> * Made functions defined in papr_scm_pdsm.h as static inline. [Mpe]
>=20
> v5..v6 :
> * Changed the usage of the term DSM to PDSM to distinguish it from the
>   ACPI term [ Dan Williams ]
> * Renamed papr_scm_dsm.h to papr_scm_pdsm.h and updated various
> struct
>   to reflect the new terminology.
> * Updated the patch description and title to reflect the new terminology.
> * Squashed patch to introduce new command family in 'ndctl.h' with
>   this patch [ Dan Williams ]
> * Updated the papr_scm_pdsm method starting index from 0x10000 to 0x0
>   [ Dan Williams ]
> * Removed redundant license text from the papr_scm_psdm.h file.
>   [ Dan Williams ]
> * s/envelop/envelope/ at various places [ Dan Williams ]
> * Added '__packed' attribute to command package header to gaurd
>   against different compiler adding paddings between the fields.
>   [ Dan Williams]
> * Converted various pr_debug to dev_debug [ Dan Williams ]
>=20
> v4..v5 :
> * None
>=20
> v3..v4 :
> * None
>=20
> v2..v3 :
> * Updated the patch prefix to 'ndctl/uapi' [Aneesh]
>=20
> v1..v2 :
> * None
> ---
>  arch/powerpc/include/uapi/asm/papr_pdsm.h | 136
> ++++++++++++++++++++++  arch/powerpc/platforms/pseries/papr_scm.c |
> 101 +++++++++++++++-
>  include/uapi/linux/ndctl.h                |   1 +
>  3 files changed, 232 insertions(+), 6 deletions(-)  create mode 100644
> arch/powerpc/include/uapi/asm/papr_pdsm.h
>=20
> diff --git a/arch/powerpc/include/uapi/asm/papr_pdsm.h
> b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> new file mode 100644
> index 000000000000..6407fefcc007
> --- /dev/null
> +++ b/arch/powerpc/include/uapi/asm/papr_pdsm.h
> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/*
> + * PAPR nvDimm Specific Methods (PDSM) and structs for libndctl
> + *
> + * (C) Copyright IBM 2020
> + *
> + * Author: Vaibhav Jain <vaibhav at linux.ibm.com>  */
> +
> +#ifndef _UAPI_ASM_POWERPC_PAPR_PDSM_H_
> +#define _UAPI_ASM_POWERPC_PAPR_PDSM_H_
> +
> +#include <linux/types.h>
> +
> +/*
> + * PDSM Envelope:
> + *
> + * The ioctl ND_CMD_CALL transfers data between user-space and kernel
> +via
> + * envelope which consists of a header and user-defined payload sections=
.
> + * The header is described by 'struct nd_pdsm_cmd_pkg' which expects a
> + * payload following it and accessible via 'nd_pdsm_cmd_pkg.payload' fie=
ld.
> + * There is reserved field that can used to introduce new fields to the
> + * structure in future. It also tries to ensure that
> 'nd_pdsm_cmd_pkg.payload'
> + * lies at a 8-byte boundary.
> + *
> + *  +-------------+---------------------+---------------------------+
> + *  |   64-Bytes  |       16-Bytes      |       Max 176-Bytes       |
> + *  +-------------+---------------------+---------------------------+
> + *  |               nd_pdsm_cmd_pkg     |                           |
> + *  |-------------+                     |                           |
> + *  |  nd_cmd_pkg |                     |                           |
> + *  +-------------+---------------------+---------------------------+
> + *  | nd_family   |                     |                           |
> + *  | nd_size_out | cmd_status          |                           |
> + *  | nd_size_in  | payload_version     |     payload               |
> + *  | nd_command  | reserved            |                           |
> + *  | nd_fw_size  |                     |                           |
> + *  +-------------+---------------------+---------------------------+
> + *
> + * PDSM Header:
> + *
> + * The header is defined as 'struct nd_pdsm_cmd_pkg' which embeds a
> + * 'struct nd_cmd_pkg' instance. The PDSM command is assigned to
> member
> + * 'nd_cmd_pkg.nd_command'. Apart from size information of the
> envelope
> +which is
> + * contained in 'struct nd_cmd_pkg', the header also has members
> +following
> + * members:
> + *
> + * 'cmd_status'		: (Out) Errors if any encountered while
> servicing PDSM.
> + * 'payload_version'	: (In/Out) Version number associated with the
> payload.
> + * 'reserved'		: Not used and reserved for future.
> + *
> + * PDSM Payload:
> + *
> + * The layout of the PDSM Payload is defined by various structs shared
> +between
> + * papr_scm and libndctl so that contents of payload can be
> +interpreted. During
> + * servicing of a PDSM the papr_scm module will read input args from
> +the payload
> + * field by casting its contents to an appropriate struct pointer based
> +on the
> + * PDSM command. Similarly the output of servicing the PDSM command
> +will be
> + * copied to the payload field using the same struct.
> + *
> + * 'libnvdimm' enforces a hard limit of 256 bytes on the envelope size,
> +which
> + * leaves around 176 bytes for the envelope payload (ignoring any
> +padding that
> + * the compiler may silently introduce).
> + *
> + * Payload Version:
> + *
> + * A 'payload_version' field is present in PDSM header that indicates a
> +specific
> + * version of the structure present in PDSM Payload for a given PDSM
> command.
> + * This provides backward compatibility in case the PDSM Payload
> +structure
> + * evolves and different structures are supported by 'papr_scm' and
> 'libndctl'.
> + *
> + * When sending a PDSM Payload to 'papr_scm', 'libndctl' should send
> +the version
> + * of the payload struct it supports via 'payload_version' field. The
> 'papr_scm'
> + * module when servicing the PDSM envelope checks the 'payload_version'
> +and then
> + * uses 'payload struct version' =3D=3D MIN('payload_version field',
> + * 'max payload-struct-version supported by papr_scm') to service the
> PDSM.
> + * After servicing the PDSM, 'papr_scm' put the negotiated version of
> +payload
> + * struct in returned 'payload_version' field.
> + *
> + * Libndctl on receiving the envelope back from papr_scm again checks
> +the
> + * 'payload_version' field and based on it use the appropriate version
> +dsm
> + * struct to parse the results.
> + *
> + * Backward Compatibility:
> + *
> + * Above scheme of exchanging different versioned PDSM struct between
> +libndctl
> + * and papr_scm should provide backward compatibility until following
> +two
> + * assumptions/conditions when defining new PDSM structs hold:
> + *
> + * Let T(X) =3D { set of attributes in PDSM struct 'T' versioned X }
> + *
> + * 1. T(X) is a proper subset of T(Y) if Y > X.
> + *    i.e Each new version of PDSM struct should retain existing struct
> + *    attributes from previous version
> + *
> + * 2. If an entity (libndctl or papr_scm) supports a PDSM struct T(X) th=
en
> + *    it should also support T(1), T(2)...T(X - 1).
> + *    i.e When adding support for new version of a PDSM struct, libndctl
> + *    and papr_scm should retain support of the existing PDSM struct
> + *    version they support.
> + */
> +
> +/* PDSM-header + payload expected with ND_CMD_CALL ioctl from
> libnvdimm
> +*/ struct nd_pdsm_cmd_pkg {
> +	struct nd_cmd_pkg hdr;	/* Package header containing sub-
> cmd */
> +	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
> +	__u16 reserved[5];	/* Ignored and to be used in future */
> +	__u16 payload_version;	/* In/Out: version of the payload */
> +	__u8 payload[];		/* In/Out: Sub-cmd data buffer */
> +} __packed;
> +
> +/*
> + * Methods to be embedded in ND_CMD_CALL request. These are sent to
> the
> +kernel
> + * via 'nd_pdsm_cmd_pkg.hdr.nd_command' member of the ioctl struct  */
> +enum papr_pdsm {
> +	PAPR_PDSM_MIN =3D 0x0,
> +	PAPR_PDSM_MAX,
> +};
> +
> +/* Convert a libnvdimm nd_cmd_pkg to pdsm specific pkg */ static inline
> +struct nd_pdsm_cmd_pkg *nd_to_pdsm_cmd_pkg(struct nd_cmd_pkg
> *cmd) {
> +	return (struct nd_pdsm_cmd_pkg *) cmd; }
> +
> +/* Return the payload pointer for a given pcmd */ static inline void
> +*pdsm_cmd_to_payload(struct nd_pdsm_cmd_pkg *pcmd) {
> +	if (pcmd->hdr.nd_size_in =3D=3D 0 && pcmd->hdr.nd_size_out =3D=3D 0)
> +		return NULL;
> +	else
> +		return (void *)(pcmd->payload);
> +}
> +
> +#endif /* _UAPI_ASM_POWERPC_PAPR_PDSM_H_ */
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
> b/arch/powerpc/platforms/pseries/papr_scm.c
> index 149431594839..5e2237e7ec08 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -15,13 +15,15 @@
>  #include <linux/seq_buf.h>
>=20
>  #include <asm/plpar_wrappers.h>
> +#include <asm/papr_pdsm.h>
>=20
>  #define BIND_ANY_ADDR (~0ul)
>=20
>  #define PAPR_SCM_DIMM_CMD_MASK \
>  	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
>  	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
> -	 (1ul << ND_CMD_SET_CONFIG_DATA))
> +	 (1ul << ND_CMD_SET_CONFIG_DATA) | \
> +	 (1ul << ND_CMD_CALL))
>=20
>  /* DIMM health bitmap bitmap indicators */
>  /* SCM device is unable to persist memory contents */ @@ -350,16 +352,97
> @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
>  	return 0;
>  }
>=20
> +/*
> + * Validate the inputs args to dimm-control function and return '0' if v=
alid.
> + * This also does initial sanity validation to ND_CMD_CALL sub-command
> packages.
> + */
> +static int is_cmd_valid(struct nvdimm *nvdimm, unsigned int cmd, void
> *buf,
> +		       unsigned int buf_len)
> +{
> +	unsigned long cmd_mask =3D PAPR_SCM_DIMM_CMD_MASK;
> +	struct nd_pdsm_cmd_pkg *pkg =3D nd_to_pdsm_cmd_pkg(buf);
> +	struct papr_scm_priv *p;
> +
> +	/* Only dimm-specific calls are supported atm */
> +	if (!nvdimm)
> +		return -EINVAL;
> +
> +	/* get the provider date from struct nvdimm */
> +	p =3D nvdimm_provider_data(nvdimm);
> +
> +	if (!test_bit(cmd, &cmd_mask)) {
> +		dev_dbg(&p->pdev->dev, "Unsupported cmd=3D%u\n", cmd);
> +		return -EINVAL;
> +	} else if (cmd =3D=3D ND_CMD_CALL) {
> +
> +		/* Verify the envelope package */
> +		if (!buf || buf_len < sizeof(struct nd_pdsm_cmd_pkg)) {
> +			dev_dbg(&p->pdev->dev, "Invalid pkg size=3D%u\n",
> +				buf_len);
> +			return -EINVAL;
> +		}
> +
> +		/* Verify that the PDSM family is valid */
> +		if (pkg->hdr.nd_family !=3D NVDIMM_FAMILY_PAPR) {
> +			dev_dbg(&p->pdev->dev, "Invalid pkg
> family=3D0x%llx\n",
> +				pkg->hdr.nd_family);
> +			return -EINVAL;
> +
> +		}
> +
> +		/* We except a payload with all PDSM commands */
> +		if (pdsm_cmd_to_payload(pkg) =3D=3D NULL) {
> +			dev_dbg(&p->pdev->dev,
> +				"Empty payload for sub-command=3D0x%llx\n",
> +				pkg->hdr.nd_command);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* Command looks valid */

So this is where I would expect the kernel to validate the command vs a kno=
wn list of supported commands / payloads. One of the goals of requiring pub=
lic documentation of any commands that libnvdimm might support for the ioct=
l path is to give the kernel the ability to gate future enabling on conside=
ration of a common kernel front-end interface. I believe this would also ad=
dress questions about the versioning scheme because userspace would be acti=
vely prevented from sending command payloads that were not first explicitly=
 enabled in the kernel. This interface as it stands in this patch set seems=
 to be a very thin / "anything goes" passthrough with no consideration for =
that policy.

As an example of the utility of this policy, consider the recent support fo=
r nvdimm security commands that allow a passphrase to be set and issue comm=
ands like "unlock" and "secure erase". The kernel actively prevents those c=
ommands from being sent from userspace. See acpi_nfit_clear_to_send() and n=
d_cmd_clear_to_send(). The reasoning is that it enforces the kernel's nvdim=
m security model that uses encrypted/trusted keys to protect key material (=
clear text keys only-ever exist in kernel-space). Yes, that restriction is =
painful for people that don't want the kernel's security model and just wan=
t the simplicity of passing clear-text keys around, but it's necessary for =
the kernel to have any chance to provide a common abstraction across vendor=
s. The pain of negotiating every single command with what the kernel will s=
upport is useful for the long term health of the kernel. It forces ongoing =
conversations across vendors to consolidate interfaces and reuse kernel bes=
t practices like encrypted/trusted keys. Code acceptance is the only real g=
ate the kernel has to enforce cooperation across vendors.

The expectation is that the kernel does not allow any command to pass that =
is not explicitly listed in a bitmap of known commands. I would expect that=
 if you changed the payload of an existing command that would likely requir=
e a new entry in this bitmap. The goal is to give the kernel a chance to co=
nstrain the passthrough interface to afford a chance to have a discussion o=
f what might done in a common implementation. Another example is the label-=
area read-write commands. The kernel needs explicit control to ensure that =
it owns the label area and that userspace is not able to corrupt it (write =
it behind the kernel's back).

Now that said, I have battle scars with some OEMs that just want a generic =
passthrough interface so they never need to work with the kernel community =
again and can just write their custom validation tooling and be done. I've =
mostly been successful in that fight outside of the gaping hole of ND_CMD_V=
ENDOR. That's the path that ipmctl has used to issue commands that have not=
 made it into the public specification on docs.pmem.io. My warning shot for=
 that is the "disable_vendor_specific" module option that administrators ca=
n set to only allow commands that the kernel explicitly knows the effects o=
f to be issued. The result is only tooling / enabling that submits to this =
auditing regime is guaranteed to work everywhere.

So, that long explanation out of the way, what does that mean for this patc=
h set? I'd like to understand if you still see a need for a versioning sche=
me if the implementation is required to explicitly list all the commands it=
 supports? I.e. that the kernel need not worry about userspace sending futu=
re unknown payloads because unknown payloads are blocked. Also if your inte=
rface has anything similar to a "vendor specific" passthrough I would like =
to require that go through the ND_CMD_VENDOR ioctl, so that the kernel stil=
l has a common check point to prevent vendor specific "I don't want to talk=
 to the kernel community" shenanigans, but even better if ND_CMD_VENDOR is =
something the kernel can eventually jettison because nobody is using it.

I feel like this is a conversation that will take a few days to resolve, wh=
ich does not leave time to push this for v5.8. That said, I do think the he=
alth flags patches at the beginning of this series are low risk and unconte=
ntious. How about I merge those for v5.8 and circle back to get this ioctl =
path queued early in v5.8-rc? Apologies for the late feedback on this relat=
ive to v5.8.

