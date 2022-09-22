Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B835E5AB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 07:30:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY3lM4jyQz3c8j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 15:30:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ac215hGA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ac215hGA;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY3kf4DThz305M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 15:29:45 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28M4eE9R003145;
	Thu, 22 Sep 2022 05:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=onCbqLp8wm+Z6OjTP02Ay3zCXQgaBksEKDZPTkzLOqQ=;
 b=Ac215hGADXTytsYU7/4+TBvPTTlbmGWAhrAUg3pR/JBAVTIYJJOonzUuuKU9hH3YBi9W
 J7I+041tZwQKpcI/IuGiEvqj7xU0SDq9/vJqndksZs0vghXvXgOpXaf+gnO4obGC+vMB
 oGE5qKl5QNVqjVcVp84sMrRD/+ccEno+/+I5HVN0I6rskFtgzFdVtYhOz7OuzVrAEtqW
 3/kmsgXUyug2PLKJp77Rfhz4OPlsmXtqLzbxR6/HdzMfyP4klIeA4GS2eLkmG8ybA7tq
 QDScM3B1407JwiusQNqR2TwYvJlAg/vTynAUD5i3cH7cFxK6WpFsTth7TLGWI0ofvApy MA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrg6a9qsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 05:29:41 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28M5LmJP006984;
	Thu, 22 Sep 2022 05:29:39 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma03ams.nl.ibm.com with ESMTP id 3jn5v9649v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 05:29:39 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28M5TbHg37880294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Sep 2022 05:29:37 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DB08A4051;
	Thu, 22 Sep 2022 05:29:37 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02D91A4040;
	Thu, 22 Sep 2022 05:29:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.104.67])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 22 Sep 2022 05:29:35 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [powerpc] memcpy warning drivers/scsi/scsi_transport_fc.c:581
 (next-20220921)
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <202209211250.3049C29@keescook>
Date: Thu, 22 Sep 2022 10:59:34 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <941B194C-3BB4-453B-822C-7280778AB3D0@linux.ibm.com>
References: <42404B5E-198B-4FD3-94D6-5E16CF579EF3@linux.ibm.com>
 <202209211250.3049C29@keescook>
To: Kees Cook <keescook@chromium.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CzI29J32q84GGrJpMa3XLWEaX2k6dc36
X-Proofpoint-GUID: CzI29J32q84GGrJpMa3XLWEaX2k6dc36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209220032
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
Cc: linux-next@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 22-Sep-2022, at 2:13 AM, Kees Cook <keescook@chromium.org> wrote:
>=20
> On Wed, Sep 21, 2022 at 09:21:52PM +0530, Sachin Sant wrote:
>> While booting recent linux-next kernel on a Power server following
>> warning is seen:
>>=20
>> [    6.427054] lpfc 0022:01:00.0: 0:6468 Set host date / time: Status =
x10:
>> [    6.471457] lpfc 0022:01:00.0: 0:6448 Dual Dump is enabled
>> [    7.432161] ------------[ cut here ]------------
>> [    7.432178] memcpy: detected field-spanning write (size 8) of =
single field "&event->event_data" at =
drivers/scsi/scsi_transport_fc.c:581 (size 4)
>=20
> Interesting!
>=20
> The memcpy() is this one:
>=20
>                memcpy(&event->event_data, data_buf, data_len);
>=20
> The struct member, "event_data" is defined as u32:
>=20
> ...
> * Note: if Vendor Unique message, &event_data will be  start of
> * Note: if Vendor Unique message, event_data_flex will be start of
> *      vendor unique payload, and the length of the payload is
> *       per event_datalen
> ...
> struct fc_nl_event {
>        struct scsi_nl_hdr snlh;                /* must be 1st element =
!  */
>        __u64 seconds;
>        __u64 vendor_id;
>        __u16 host_no;
>        __u16 event_datalen;
>        __u32 event_num;
>        __u32 event_code;
>        __u32 event_data;
> } __attribute__((aligned(sizeof(__u64))));
>=20
> The warning says memcpy is trying to write 8 bytes into the 4 byte
> member, so the compiler is seeing it "correctly", but I think this is
> partially a false positive. It looks like there is also a small bug in
> the allocation size calculation and therefore a small leak of kernel
> heap memory contents. My notes:
>=20
> void
> fc_host_post_fc_event(struct Scsi_Host *shost, u32 event_number,
>                enum fc_host_event_code event_code,
>                u32 data_len, char *data_buf, u64 vendor_id)
> {
> 	...
>        struct fc_nl_event *event;
> 	...
>        if (!data_buf || data_len < 4)
>                data_len =3D 0;
>=20
> This wants a data_buf and a data_len >=3D 4, so it does look like it's
> expected to be variable sized. There does appear to be an alignment
> and padding expectation, though:
>=20
> /* macro to round up message lengths to 8byte boundary */
> #define FC_NL_MSGALIGN(len)             (((len) + 7) & ~7)
>=20
> 	...
>        len =3D FC_NL_MSGALIGN(sizeof(*event) + data_len);
>=20
> But this is immediately suspicious: sizeof(*event) _includes_ =
event_data,
> so the alignment is going to be bumped up incorrectly. Note that
> struct fc_nl_event is 8 * 5 =3D=3D 40 bytes, which allows for 4 bytes =
in
> event_data. But setting data_len to 4 (i.e. no "overflow") means we're
> asking for 44 bytes, which is aligned to 48.
>=20
> So, in all cases, there is uninitialized memory being sent...
>=20
>        skb =3D nlmsg_new(len, GFP_KERNEL);
> 	...
>        nlh =3D nlmsg_put(skb, 0, 0, SCSI_TRANSPORT_MSG, len, 0);
> 	...
>        event =3D nlmsg_data(nlh);
> 	...
>        event->event_datalen =3D data_len;        /* bytes */
>=20
> Comments in the struct say this is counting from start of event_data.
>=20
> 	...
>        if (data_len)
>                memcpy(&event->event_data, data_buf, data_len);
>=20
> And here is the reported memcpy().
>=20
> The callers of fc_host_post_fc_event() are:
>=20
>        fc_host_post_fc_event(shost, event_number, event_code,
>                (u32)sizeof(u32), (char *)&event_data, 0);
>=20
> Fixed-size of 4 bytes: no "overflow".
>=20
>        fc_host_post_fc_event(shost, event_number, =
FCH_EVT_VENDOR_UNIQUE,
>                data_len, data_buf, vendor_id);
>=20
>        fc_host_post_fc_event(shost, fc_get_event_number(),
>                                FCH_EVT_LINK_FPIN, fpin_len, fpin_buf, =
0);
>=20
> These two appear to be of arbitrary length, but I didn't look more
> deeply.
>=20
> Given that the only user of struct fc_nl_event is =
fc_host_post_fc_event()
> in drivers/scsi/scsi_transport_fc.c, it looks safe to say that =
changing
> the struct to use a flexible array is the thing to do in the kernel, =
but
> we can't actually change the size or layout because it's a UAPI =
header.
>=20
> Are you able to test this patch:

Thank you for the detailed analysis.
With this patch applied I don=E2=80=99t see the warning.

Thanks
- Sachin

