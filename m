Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 458B13748E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 14:54:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KQbn5dzqzDqlJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 22:54:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KQW73n2pzDqjT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 22:50:43 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x56ChGp7027664
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Jun 2019 08:50:40 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sy2sp9c37-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 08:50:40 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Thu, 6 Jun 2019 13:50:38 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 13:50:34 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x56CoXro44630238
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 12:50:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFDCA52052;
 Thu,  6 Jun 2019 12:50:33 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.84.230])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8731952051;
 Thu,  6 Jun 2019 12:50:32 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Oliver <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/nvdimm: Add support for multibyte read/write for
 metadata
In-Reply-To: <8736konw3i.fsf@concordia.ellerman.id.au>
References: <20190602044350.31660-1-aneesh.kumar@linux.ibm.com>
 <CAOSf1CEsWiDyc3rAzNoPwBUUhs4deXt_1MJpuKUV_CP-LJhjhw@mail.gmail.com>
 <87ef49hg85.fsf@linux.ibm.com> <8736konw3i.fsf@concordia.ellerman.id.au>
Date: Thu, 06 Jun 2019 18:20:31 +0530
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19060612-0008-0000-0000-000002F089B7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060612-0009-0000-0000-0000225D75D3
Message-Id: <878sueho88.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060091
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> Oliver <oohall@gmail.com> writes:
>>> On Sun, Jun 2, 2019 at 2:44 PM Aneesh Kumar K.V
>>> <aneesh.kumar@linux.ibm.com> wrote:
> ...
>>>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>>>> index 0176ce66673f..e33cebb8ee6c 100644
>>>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>>>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>>>> @@ -97,42 +97,102 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
>>>>  }
>>>>
>>>>  static int papr_scm_meta_get(struct papr_scm_priv *p,
>>>> -                       struct nd_cmd_get_config_data_hdr *hdr)
>>>> +                            struct nd_cmd_get_config_data_hdr *hdr)
>>>>  {
>>>>         unsigned long data[PLPAR_HCALL_BUFSIZE];
>>>> +       unsigned long offset, data_offset;
>>>> +       int len, read;
>>>>         int64_t ret;
>>>>
>>>> -       if (hdr->in_offset >= p->metadata_size || hdr->in_length != 1)
>>>> +       if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
>>>>                 return -EINVAL;
>>>>
>>>> -       ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
>>>> -                       hdr->in_offset, 1);
>>>> -
>>>> -       if (ret == H_PARAMETER) /* bad DRC index */
>>>> -               return -ENODEV;
>>>> -       if (ret)
>>>> -               return -EINVAL; /* other invalid parameter */
>>>> -
>>>> -       hdr->out_buf[0] = data[0] & 0xff;
>>>> -
>>>> +       for (len = hdr->in_length; len; len -= read) {
>>>> +
>>>> +               data_offset = hdr->in_length - len;
>>>> +               offset = hdr->in_offset + data_offset;
>>>> +
>>>> +               if (len >= 8)
>>>> +                       read = 8;
>>>> +               else if (len >= 4)
>>>> +                       read = 4;
>>>> +               else if ( len >= 2)
>>>> +                       read = 2;
>>>> +               else
>>>> +                       read = 1;
>>>> +
>>>> +               ret = plpar_hcall(H_SCM_READ_METADATA, data, p->drc_index,
>>>> +                                 offset, read);
>>>> +
>>>> +               if (ret == H_PARAMETER) /* bad DRC index */
>>>> +                       return -ENODEV;
>>>> +               if (ret)
>>>> +                       return -EINVAL; /* other invalid parameter */
>>>> +
>>>> +               switch (read) {
>>>> +               case 8:
>>>> +                       *(uint64_t *)(hdr->out_buf + data_offset) = be64_to_cpu(data[0]);
>>>> +                       break;
>>>> +               case 4:
>>>> +                       *(uint32_t *)(hdr->out_buf + data_offset) = be32_to_cpu(data[0] & 0xffffffff);
>>>> +                       break;
> ...
>>>
>>> I assume you got the qemu bits sorted out with Shiva? Looks good otherwise.
>>
>> That is correct. I also tested with different xfer values (1, 2, 4, 8)
>> on both Qemu and PowerVM.
>
> With a big endian kernel?

I completed this testing and found new bugs in other parts of the code.

Thanks for the sugestion.

-aneesh

