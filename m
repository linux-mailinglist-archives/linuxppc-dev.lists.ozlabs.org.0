Return-Path: <linuxppc-dev+bounces-11396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9DB389F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 20:56:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBv061gRtz2yDH;
	Thu, 28 Aug 2025 04:56:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756321014;
	cv=none; b=OKsTvCb2tIbvbPnLm0jSFqtsZrpTqjD6uxZPk1efKmbgZBbjUbXY1EProP4vChUuNsKayMXD4mNNnxbY5AfH6/WlrltxWvwtUieEpZKATkjQK2iL6ti+Gk6IJfr0DPGl74X938hi7XwfygSRP9EyEOI+M+9dW4hWY0zTGprPzhtNwF3wdogNkShweZKqC6ReLWo1gAKjtMFQkPvg5BSfhL0wBpndrocQtBB/KJ67CTv4Zx+A33Rzwpzv36pra2Ohe6+Hmxu6kY77qsPTtNhWnQYGILBNtxnf/WhbZcom2k8ld/GKnCnGjuGqVZFXM1a0o+GZP9mPXcV2y0SXx6CjYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756321014; c=relaxed/relaxed;
	bh=A+7CpVFd3RU6DQIQG3gfJcrQmiLeJTDJiZ+KUHgSdS4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DOGK6CqEktYwP+b8PY8Ru89p/Nmbiqj5BWfB/XF24oFeViYgSwTVlfm14BBad6IVkS2fKmV0+BZaAv1HCyU4i3NGcHflPgeqMRYjMwDKaTK6LxypxNOtv89VENopm8J4xzHVSPWQ8oI5N12Z/4hr5OV9u9tdwjHd8VdD8a5DkgbEUZUcf+k2aua3D0Diyfhm9kbHd5w+orqqOrZSR8DsACmDGJwhg9dN+ZB+1CtpREhQK6ogvLxHXrXs6F9K3HvIvLQbSRRrat9xI7ftrMreASQDEH8uZDT/bcqMPPiN9PmjhhKT7XcLXM9Kjo+pwfqQbotSPUGBgF7BtXVX4GDgMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O7gN9Dnu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O7gN9Dnu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBv050rQgz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 04:56:52 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R8ab2H015673;
	Wed, 27 Aug 2025 18:56:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=A+7CpV
	Fd3RU6DQIQG3gfJcrQmiLeJTDJiZ+KUHgSdS4=; b=O7gN9DnuYxl44INBHHa2fW
	JLtKp1t4/RFKtbSOp7doTjcsUHcRvsfmD5iWcYKV13DTNcDLFvCG44JStmLFSISQ
	or4W5cD8zzOfmFgAb9L+PrM2bR7E8NDGcGQZb4/rX+ep/EP+95GiI3/HYd7MsyGZ
	T55osHNP9p7sUc63H935jRv0Cu89S94+9XWuGYggFlmjepqYzmzCu2+eNAKzWYaK
	vyC/qAhR9jmkh70yaZs5YF8jpO1lasrU8J/ROKs+3Paxx4Lp6Jj6aH48UILdMCJQ
	onv4MvyC+YOnf/zkX/Z5PUmNBUHJN2Ullraj6/jPgp9Vgf25bouzCpiNAHebUzEA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hq5kvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 18:56:43 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57RIs4MK030357;
	Wed, 27 Aug 2025 18:56:42 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hq5kvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 18:56:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57RIbXo1007451;
	Wed, 27 Aug 2025 18:56:42 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qqyuhmb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 18:56:42 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57RIueKH22741662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Aug 2025 18:56:40 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F3CA5805A;
	Wed, 27 Aug 2025 18:56:40 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7017A58054;
	Wed, 27 Aug 2025 18:56:39 +0000 (GMT)
Received: from li-4c4c4544-0038-3410-8038-c4c04f423534.ibm.com (unknown [9.61.165.221])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 27 Aug 2025 18:56:39 +0000 (GMT)
Message-ID: <fffc63bf44db7060106f9a135beccb8bdb1630ad.camel@linux.ibm.com>
Subject: Re: [PATCH v2 3/9] powerpc/pseries: Add papr-hvpipe char driver for
 HVPIPE interfaces
From: Haren Myneni <haren@linux.ibm.com>
To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        msuchanek@suse.de, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com
Date: Wed, 27 Aug 2025 11:56:38 -0700
In-Reply-To: <24e2lr6ylufnhz3gimehaqvb6jlr73gxsd67gmn26tuinx7r25@xe3cwjrm7v4y>
References: <20250812225715.339225-1-haren@linux.ibm.com>
	 <20250812225715.339225-4-haren@linux.ibm.com>
	 <24e2lr6ylufnhz3gimehaqvb6jlr73gxsd67gmn26tuinx7r25@xe3cwjrm7v4y>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX2op+1TGL5mmt
 FNvfcjzv5OrUG5NmjtSwEeKpPE1A78hsG2PCnxkGrs1iLIPEqkRbUMYjyc140Hr3WSK8yXgeGYe
 OQvfqERndcyFPuTAp7zdLXjUFxyQF84lQQaM1tQhGlkrUMNsC8nTZs3JsWzr4W2s3/QoOM7VgQD
 YeX2V41HQF6sn1d3lKRQduqtV3xGFwcEh7sjhqqAoPr0viAIWnTjsHwhWEEOchrZKZJkYbw8+Jw
 kOjou5WyKU0h5zw0LQX2C+dGq5d6F9+RIlj5S3sRjgTwwIfs1eGqfbJAL+RYota1BuhaRGV5o4m
 4SuEDv+98l09q7q5Bnbofa/P6uh+ejgHaRKVdaCp0H6a8DvXV4SfO3ko44kYwGSSBk7pfBuEIy2
 QPEnoldD
X-Proofpoint-ORIG-GUID: ZwiCbGdAEhS33eN4ezc-64T97N8LS8ud
X-Proofpoint-GUID: Wu--BVSSOLNCSGia04ZL8mTItdKryM2Q
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68af54eb cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=5kSgMNO3gAuZmNTKxu8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-08-27 at 23:45 +0530, Mahesh J Salgaonkar wrote:
> On 2025-08-12 15:57:07 Tue, Haren Myneni wrote:
> > The hypervisor provides ibm,send-hvpipe-msg and
> > ibm,receive-hvpipe-msg RTAS calls which can be used by the
> > partition to communicate through an inband hypervisor channel with
> > different external sources such as Hardware Management Console
> > (HMC). The information exchanged, whether it be messages, raw or
> > formatted data, etc., is only known to between applications in the
> > OS and the source (HMC). This patch adds papr-hvpipe character
> > driver and provides the standard interfaces such as open / ioctl/
> > read / write to user space for exchanging information with HMC
> > using send/recevive HVPIPE RTAS functions.
> >=20
> > PAPR (7.3.32 Hypervisor Pipe Information Exchange) defines the
> > HVPIPE usage:
> > - The hypervisor has one HVPIPE per partition for all sources.
> > - OS can determine this feature=E2=80=99s availability by detecting the
> > =C2=A0 =E2=80=9Cibm,hypervisor-pipe-capable=E2=80=9D property in the /r=
tas node of the
> > =C2=A0 device tree.
> > - Each source is represented by the source ID which is used in
> > =C2=A0 send / recv HVPIPE RTAS. (Ex: source ID is the target for the
> > =C2=A0 payload in send RTAS).
> > - Return status of ibm,send-hvpipe-msg can be considered as
> > =C2=A0 delivered the payload.
> > - Return status of ibm,receive-hvpipe-msg can be considered as
> > =C2=A0 ACK to source.
> > - The hypervisor generates hvpipe message event interrupt when
> > =C2=A0 the partition has the payload to receive.
> >=20
> > Provide the interfaces to the user space with /dev/papr-hvpipe
> > character device using the following programming model:
> >=20
> > int devfd =3D open("/dev/papr-hvpipe")
> > int fd =3D ioctl(devfd, PAPR_HVPIPE_IOC_CREATE_HANDLE, &srcID);
> > - Restrict the user space to use the same source ID and do not
> > =C2=A0 expect more than one process access with the same source.
> > char *buf =3D malloc(size);
> > - SIZE should be 4K and the buffer contains header and the
> > =C2=A0 payload.
> > length =3D write(fd, buf, size);
> > - OS issues ibm,send-hvpipe-msg RTAS and returns the RTAS status
> > =C2=A0 to the user space.
> > ret =3D poll(fd,...)
> > - The HVPIPE event message IRQ wakes up for any waiting FDs.
> > length =3D read(fd, buf, size);
> > - OS issues ibm,receive-hvpipe-msg to receive payload from the
> > =C2=A0 hypervisor.
> > release(fd);
> > - OS issues ibm,receive-hvpipe-msg if any payload is pending so
> > =C2=A0 that pipe is not blocked.
> >=20
> > The actual implementation of these calls are added in the
> > next patches.
> >=20
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> > =C2=A0arch/powerpc/platforms/pseries/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0arch/powerpc/platforms/pseries/papr-hvpipe.c | 274
> > +++++++++++++++++++
> > =C2=A0arch/powerpc/platforms/pseries/papr-hvpipe.h |=C2=A0 14 +
> > =C2=A03 files changed, 289 insertions(+)
> > =C2=A0create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.c
> > =C2=A0create mode 100644 arch/powerpc/platforms/pseries/papr-hvpipe.h
> >=20
> [...]
> > +static int papr_hvpipe_dev_create_handle(u32 srcID)
> > +{
> > +	struct hvpipe_source_info *src_info;
> > +	struct file *file;
> > +	long err;
> > +	int fd;
> > +
> > +	spin_lock(&hvpipe_src_list_lock);
> > +	/*
> > +	 * Do not allow more than one process communicates with
> > +	 * each source.
> > +	 */
> > +	src_info =3D hvpipe_find_source(srcID);
> > +	if (src_info) {
> > +		spin_unlock(&hvpipe_src_list_lock);
> > +		pr_err("pid(%d) is already using the
> > source(%d)\n",
> > +				src_info->tsk->pid, srcID);
> > +		return -EALREADY;
> > +	}
> > +	spin_unlock(&hvpipe_src_list_lock);
>=20
> What if two process simulteneously try to get handle ? The new
> src_info
> node being allocated below isn't yet on the list. Which means as soon
> as
> we unlock, there is a chance another process can still come here
> requesting for same srcID and eventually we will see duplicate or
> more
> entries for same srcID added to the list from different processes.

Thanks for finding this issue.

yes, generally the user space should not open with the same source
again if follows HVPIPE semantics, but it is possible. In this case,
end up notifying the first FD in the list for each receive HVPIPE data.

As you suggested, will check again before adding to the list.

Thanks
Haren

>=20
> > +
> > +	src_info =3D kzalloc(sizeof(*src_info), GFP_KERNEL_ACCOUNT);
> > +	if (!src_info)
> > +		return -ENOMEM;
> > +
> > +	src_info->srcID =3D srcID;
> > +	src_info->tsk =3D current;
> > +	init_waitqueue_head(&src_info->recv_wqh);
> > +
> > +	fd =3D get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> > +	if (fd < 0) {
> > +		err =3D fd;
> > +		goto free_buf;
> > +	}
> > +
> > +	file =3D anon_inode_getfile("[papr-hvpipe]",
> > +			&papr_hvpipe_handle_ops, (void *)src_info,
> > +			O_RDWR);
> > +	if (IS_ERR(file)) {
> > +		err =3D PTR_ERR(file);
> > +		goto put_fd;
> > +	}
> > +
> > +	fd_install(fd, file);
> > +
> > +	spin_lock(&hvpipe_src_list_lock);
>=20
> Should we check again here to make sure same srcID hasn't been
> already
> added to the list while we were unlocked and return -EALREADY ?
>=20
> > +	list_add(&src_info->list, &hvpipe_src_list);
> > +	spin_unlock(&hvpipe_src_list_lock);
> > +
> > +	return fd;
> > +
> > +put_fd:
> > +	put_unused_fd(fd);
> > +free_buf:
> > +	kfree(src_info);
> > +	return err;
> > +}
> > +

