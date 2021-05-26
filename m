Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF1391169
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 09:30:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqjK52MkQz303h
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 17:30:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vwy4bkiv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rnsastry@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vwy4bkiv; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqj8C64ywz2yWJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 17:22:35 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14Q73OHW001539; Wed, 26 May 2021 03:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : subject : date : in-reply-to : cc : to : references :
 mime-version; s=pp1; bh=/hwYzabrOhyvuUQpPQzTXBZ7OIfcjz5RsrcQ6cWsD48=;
 b=Vwy4bkivgiXZjmxWnqUBIhrmFAFYCnFPhLtYRYx5Kzjz07rYwumNPEcsjMla8mq+m4Rn
 7o3AS7e0fV8vPzTgslh7z4bROhRWEqxe7VPwvZ5jU6FHCKIK87StFtJlkUvPUlZ9oHJ7
 9MYtPAo7HjtZ0LRfdcvud/oGdzSBNHG+GM4J78KnyO84gEXrUrS1jyMURRBXQg995jph
 BN1x4WzmrpcB9raXbKZBYYEBFcNpCYCYeUPBnXOQGVq/7WqtfQS1cwOkFaZ2qu4GqtYB
 CWotDEz095ro1H23gcn8Fdu8iv3BKBXNc3T+IaEu6h4ldr4veFE6qjBBksDga25SQm+Z wQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38shaqs0gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 03:22:26 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14Q7C2qR017187;
 Wed, 26 May 2021 07:22:25 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 38s1ht06yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 07:22:25 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14Q7MMiP27460006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 May 2021 07:22:22 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22E2BA4060;
 Wed, 26 May 2021 07:22:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0CBE4A4066;
 Wed, 26 May 2021 07:22:21 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.85.68.222])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 26 May 2021 07:22:20 +0000 (GMT)
From: Nageswara Sastry <rnsastry@linux.ibm.com>
Message-Id: <ADC327AB-A5AE-4CED-BAB1-D135DAD0EDBF@linux.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_3643135C-FADC-4D45-905D-1D7658752305"
Subject: Re: [PATCH V3 0/2] selftests/powerpc: Updates to EBB selftest for ISA
 v3.1
Date: Wed, 26 May 2021 12:52:19 +0530
In-Reply-To: <1621950703-1532-1-git-send-email-atrajeev@linux.vnet.ibm.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <1621950703-1532-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VkU_vnHDpvnYni4vJE5OEqosm5rpfYfz
X-Proofpoint-ORIG-GUID: VkU_vnHDpvnYni4vJE5OEqosm5rpfYfz
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-26_04:2021-05-25,
 2021-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=788 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260045
X-Mailman-Approved-At: Wed, 26 May 2021 17:29:50 +1000
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
Cc: Kajol Jain <kjain@linux.ibm.com>, maddy@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, shirisha.ganta1@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_3643135C-FADC-4D45-905D-1D7658752305
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On 25-May-2021, at 7:21 PM, Athira Rajeev <atrajeev@linux.vnet.ibm.com> w=
rote:
>=20
> The "no_handler_test" in ebb selftests attempts to read the PMU
> registers after closing of the event via helper function
> "dump_ebb_state". With the MMCR0 control bit (PMCCEXT) in ISA v3.1,
> read access to group B registers is restricted when MMCR0 PMCC=3D0b00.
> Hence the call to dump_ebb_state after closing of event will generate
> a SIGILL, which is expected.
>=20
> Test has below in logs:
> <<>>
> !! child died by signal 4
> failure: no_handler_test
> <<>>
>=20
Tested patches on Power9 and Power10 - PowerVM environment.

Power9 - no_handler_test - with and without patch - success
Power10 - no_handler_test - without patch - failure
Power10 - no_handler_test - with patch - success

Power9 - regs_access_pmccext_test - with patch - success
Power10 - regs_access_pmccext_test - with patch - success

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com <mailto:rnsastry@linu=
x.ibm.com>>

Thank you.=

--Apple-Mail=_3643135C-FADC-4D45-905D-1D7658752305
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 25-May-2021, at 7:21 PM, Athira Rajeev &lt;<a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">The =
"no_handler_test" in ebb selftests attempts to read the PMU<br =
class=3D"">registers after closing of the event via helper function<br =
class=3D"">"dump_ebb_state". With the MMCR0 control bit (PMCCEXT) in ISA =
v3.1,<br class=3D"">read access to group B registers is restricted when =
MMCR0 PMCC=3D0b00.<br class=3D"">Hence the call to dump_ebb_state after =
closing of event will generate<br class=3D"">a SIGILL, which is =
expected.<br class=3D""><br class=3D"">Test has below in logs:<br =
class=3D"">&lt;&lt;&gt;&gt;<br class=3D"">!! child died by signal 4<br =
class=3D"">failure: no_handler_test<br class=3D"">&lt;&lt;&gt;&gt;<br =
class=3D""><br class=3D""></div></div></blockquote></div>Tested patches =
on Power9 and Power10 - PowerVM environment.<div class=3D""><br =
class=3D""></div><div class=3D"">Power9 -&nbsp;no_handler_test - with =
and without patch - success</div><div class=3D"">Power10 =
-&nbsp;no_handler_test - without patch - failure</div><div =
class=3D"">Power10 -&nbsp;no_handler_test - with patch - =
success</div><div class=3D""><div class=3D""><br class=3D""></div><div =
class=3D"">Power9 -&nbsp;regs_access_pmccext_test - with patch - =
success</div><div class=3D"">Power10 -&nbsp;regs_access_pmccext_test - =
with patch - success</div></div><div class=3D""><br class=3D""></div><div =
class=3D""><div style=3D"margin: 0px; font-stretch: normal; line-height: =
normal;" class=3D""><span style=3D"font-kerning: none" =
class=3D"">Tested-by: Nageswara R Sastry &lt;<a =
href=3D"mailto:rnsastry@linux.ibm.com" class=3D""><span =
style=3D"-webkit-font-kerning: none; color: rgb(9, 79, 209);" =
class=3D"">rnsastry@linux.ibm.com</span></a>&gt;</span></div></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal;" =
class=3D""><span style=3D"font-kerning: none" class=3D""><br =
class=3D""></span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal;" class=3D""><span style=3D"font-kerning: none" =
class=3D"">Thank you.</span></div></body></html>=

--Apple-Mail=_3643135C-FADC-4D45-905D-1D7658752305--

