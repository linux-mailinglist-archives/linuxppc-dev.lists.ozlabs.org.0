Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7349436237A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 17:07:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMKLz6w24z3c6S
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 01:07:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HlVktblG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HlVktblG; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMKLY1Qd1z2xZH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 01:07:00 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GF45SC117001; Fri, 16 Apr 2021 11:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=WbWU7a4i5njKdlMB6x5Fpyc2NkH9nMPMKZadNALON/Q=;
 b=HlVktblGK6gqeiRweZgWYoquklRYUdtUraNG5Cuf+1mjxFF7IGjYHYP41BcvPT63Z2Mv
 FDk3EXzNIfppD2i/h4hQP6Bocu2oM0LJm0TTWdNzgz0qcndbq4+YFxOQSrOF5gUgU+Hx
 wtzBMLuOTUht6FU7V1L9RKndrIvef0NuaEu+sa98tya/RqUarLvW/FV925h2K/viIsPL
 QV7I+kteFdHA3CAYYxuA5jx9GNw5mMFrrTLlEGhaRc7eVvLBrujrmit1+7uHA3At34v/
 xLGdWBJCo/TMYY93S1clNFFzIetv/O+SzBQEzV8Ov4lDESFpWn1VJ1G/zXWKTXaVuU7S hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x88k9y2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:06:50 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13GF4XLs119292;
 Fri, 16 Apr 2021 11:06:50 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37x88k9y19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 11:06:50 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GEvPjC000821;
 Fri, 16 Apr 2021 15:06:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hmht6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 15:06:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GF6kB545613366
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 15:06:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13820A4040;
 Fri, 16 Apr 2021 15:06:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16DF5A4051;
 Fri, 16 Apr 2021 15:06:43 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.72.155])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 16 Apr 2021 15:06:42 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Fri, 16 Apr 2021 20:36:42 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/1] powerpc/papr_scm: Properly handle UUID types and
 API
In-Reply-To: <CAHp75VcPANL+LBTxy2V8f2Ksy=FJmdbU1=r60KKO7YSUf9BCLg@mail.gmail.com>
References: <20210415134637.17770-1-andriy.shevchenko@linux.intel.com>
 <87eefblbji.fsf@vajain21.in.ibm.com>
 <CAHp75VcPANL+LBTxy2V8f2Ksy=FJmdbU1=r60KKO7YSUf9BCLg@mail.gmail.com>
Date: Fri, 16 Apr 2021 20:36:42 +0530
Message-ID: <87a6pyl14t.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gj3h6l7E5xP8Yl02kFNPJ50ytsfvNNx9
X-Proofpoint-ORIG-GUID: ckxZAx8zOlRRvIGCHqvJ3VpMz7ME06ar
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_08:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160112
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "open list:LINUX
 FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Shevchenko <andy.shevchenko@gmail.com> writes:

> On Thu, Apr 15, 2021 at 8:10 PM Vaibhav Jain <vaibhav@linux.ibm.com> wrot=
e:
>>
>>
>> Thanks for the patch Andy,
>>
>> Unfortunately ran into a compilation issue due to missing "#include
>> <asm/unaligned.h>" that provides definition for
>> get_unaligned_le64(). Gcc reported following error:
>>
>> error: implicit declaration of function =E2=80=98get_unaligned_le64=E2=
=80=99
>
> Right, I have not tested it (as mentioned in the comments to the patch)
>
>> After including the necessary header file, kernel compiled fine and I
>> was able to test & verify the patch.
>
> Thank you very much for the testing.
>
> I'm not sure what the coverage of your test is.

Your patch updates the way the interleaved set-cookies are populated in
papr_scm which are then used to populate label entry for a namespace. I
verified that the reported region setcookie hasnt changed for an nvdimm
region before and after applying your patch for both BE and LE variants:

# 64-bit Little endian kernel before applying the patch
$ sudo cat /sys/devices/ndbus0/region0/set_cookie
0x8b6b26cbc930e2b5

# 64-bit Little endian kernel after applying your patch
$ sudo cat /sys/devices/ndbus0/region0/set_cookie
0x8b6b26cbc930e2b5

# 64-bit Big endian kernel before applying your patch
$ sudo cat /sys/devices/ndbus0/region0/set_cookie
0x8b6b26cbc930e2b5

# 64-bit Big endian kernel after applying your patch
$ sudo cat /sys/devices/ndbus0/region0/set_cookie
0x8b6b26cbc930e2b5

> That's why I have an
> additional question below. Is the byte ordering kept the same in BE
> (32- and 64-bit) cases? Because I'm worrying that I might have missed
> something.
Libnvdimm store these cookies in label area as little endian values and
based on the results above I think we are good.
>
>
> --=20
> With Best Regards,
> Andy Shevchenko

--=20
Cheers
~ Vaibhav
