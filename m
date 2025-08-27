Return-Path: <linuxppc-dev+bounces-11395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155BEB38982
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 20:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBtHN3q3jz2yDH;
	Thu, 28 Aug 2025 04:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756319104;
	cv=none; b=jo0/3PSReS+NN6e+dVExdneedNIx8dnH39vlwKvMiObRU+DeHZ2Wn9OW/YxLrgirs2oMA8tt/vWtZYcaQanOR2AVREsg7Te84m1wN99fikqAdYez6HLDQsrGu/+q0+RPIQhkCUH+P2ub3sBd5gnA1ehHn9P4f5MNJAI4i6dAGIi1AWjA7Jgcy6oOQeOYBxRIBfFHZC8XkCkfMm6046tpRwY9aj7T/36s1rWOxGCXVUpKZwkiSYpUtUMZasGik+6ubaZlJ5A8JsaZ+5phgO8KDl0hBq40V7mZa3qIgB209xpoZWlBlEUqH4kg9LRWIr5uqvw99v+PCd3TleT/KMlh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756319104; c=relaxed/relaxed;
	bh=JHyKy1MXM9CmMi0aPyU6/FtLtIQcC8Z2Jx9vWhEIi7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhvDjxBW9tZs70Ts65BX2iZdHdolw97k7GRQ39CdXLr3tnQLJZm1xCaKAL0mZj57xkxYnOxu4tGIDrIR/bWyF8d2u3kNwKywOfCAd2RpBXZAXuJ+wjv5sxMVHfp/GtJzgQgY7kPTz1CfNtjray4msi5EuFJPMWifpeKDbgDCMEAaVdiRxv807Q4zs+PlWqH8sD2Ri50J5hnPXBxKeasw5aS588DTD8ROale9sEHnR9Nv4mzawhwhKnuoBY39uC1cggj4V/ErINiynU4ZZNomxeXRZ72vGNaH9C2WsQpYOL8IGnPso/fKAgjuh7I14AMJ7loxAKwRrRfFMrSxbx0USw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dYEjo29n; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dYEjo29n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBtHM5HZ1z2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 04:25:03 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RHn1aZ029471;
	Wed, 27 Aug 2025 18:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=JHyKy1MXM9CmMi0aPyU6/
	FtLtIQcC8Z2Jx9vWhEIi7g=; b=dYEjo29nBOZVLvtC0hJAHjrOUmyAjUq6vsAnd
	0mhRqofAnrtrRY7kpD2+AQLhb4kQPw5Bqg8+DVqCLhz2z1JzzFnA+O7hiAZEipZW
	89o/7YxkKLrNavngrxBYQrSLRaC+bCoIO6Ceto5uOCXK9jz/99hnxSVLWydOxhLE
	ZhtSLed/w2Ix8rK3rvg+VnT3LkITqQVWLSU0w1tNj+IzZWX3MBQEilr9rHCogMwb
	4vALRlMpCsOWBn7t33iKMNTxmKxSE0kxHhht+XZtXoJCdKQSWopZRhELUvKOO1WU
	r5xnxLz42eBnNt6KvhUF6ZpJC/2DW6WLDv/r2u5kpQPqiJ5Jg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42j5mgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 18:24:54 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57RIJVLe003440;
	Wed, 27 Aug 2025 18:24:54 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q42j5mgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 18:24:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57RHHMRk002524;
	Wed, 27 Aug 2025 18:24:53 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6mh426-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 18:24:53 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57RIOnEr49152322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Aug 2025 18:24:49 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2463820043;
	Wed, 27 Aug 2025 18:24:49 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BA4720040;
	Wed, 27 Aug 2025 18:24:46 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.24.199])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 27 Aug 2025 18:24:46 +0000 (GMT)
Date: Wed, 27 Aug 2025 23:54:43 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        msuchanek@suse.de, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com
Subject: Re: [PATCH v2 5/9] powerpc/pseries: Receive payload with
 ibm,receive-hvpipe-msg RTAS
Message-ID: <ddspdgef5vrh2lag4vtc5y4sdnj56jeinvdfuzyh4aktyyfb4p@oxoicmwjr4i5>
Reply-To: mahesh@linux.ibm.com
References: <20250812225715.339225-1-haren@linux.ibm.com>
 <20250812225715.339225-6-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812225715.339225-6-haren@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxMCBTYWx0ZWRfX54vuzF+QbSwY
 R9VEtzNs2fdvphY8kt0sgdTPwc61YqESkfQrFLMgKXiWhay3MmL9xgTgcVqrAq0PHt9OfAzicVW
 P+nEZn6wenfAMqaDTDPF5ZzRee81jooLr8OxpAc/TvKZe4V7jW0VpzoTSi8qNdlZc9PN0U9grCB
 WrWFmOmSicPyEKPqc2HT3jsuXCZIgPNd4a1egMf6cRKEvsjMs2GMphu731skyq+0zcbW3wtASTD
 mQkmj8dGI8i/jrqNb8dTB6mFPRv/GB6TpslgQBWXEEv38TzvbRm7GPmc+++LDXGOcPHlmlKBTuG
 sDNx475u2DTjUoTifGpjBuX1DGjMAHJISUH8kHgpaAPs7cglfzlSBwj63RIG1If8rwTEeJ2cuqv
 voVbaDai
X-Proofpoint-ORIG-GUID: So8KOLplKo5lq7oGlsO5AxcTkJ6eSTvb
X-Proofpoint-GUID: HlZCS2gHH7MErZn1PF1i38YOdCYvJQDh
X-Authority-Analysis: v=2.4 cv=evffzppX c=1 sm=1 tr=0 ts=68af4d76 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=utrk2ZHwbb84fqggAhUA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_04,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-12 15:57:09 Tue, Haren Myneni wrote:
> ibm,receive-hvpipe-msg RTAS call is used to receive data from the
> source (Ex: Hardware Management Console) over the hypervisor
> pipe. The hypervisor will signal the OS via a Hypervisor Pipe
> Event external interrupt when data is available to be received
> from the pipe and the event message has the source ID and the
> message type such as payload or closed pipe to the specific
> source. The hypervisor will not generate another interrupt for
> the next payload until the partition reads the previous payload.
> It means the hvpipe is blocked and will not deliver other events
> for any source. The maximum data length of 4048 bytes is
> supported with this RTAS call right now.
> 
> The user space uses read() to receive data from HMC which issues
> ibm,receive-hvpipe-msg RTAS and the kernel returns the buffer
> length (including papr_hvpipe_hdr length) to the user space for
> success or RTAS failure error. If the message is regarding the
> pipe closed, kernel just returns the  papr_hvpipe_hdr with
> flags = HVPIPE_LOST_CONNECTION and expects the user space to
> close FD for the corresponding source.
> 
> bm,receive-hvpipe-msg RTAS call passes the buffer and returns
> the source ID from where this payload is received and the
> payload length.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr-hvpipe.c | 164 ++++++++++++++++++-
>  arch/powerpc/platforms/pseries/papr-hvpipe.h |   1 +
>  2 files changed, 163 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> index c30f4d75e645..21483ea09489 100644
> --- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> @@ -60,6 +60,54 @@ static LIST_HEAD(hvpipe_src_list);
>   *   return code for failure.
>   */
>  
> +/*
> + * ibm,receive-hvpipe-msg RTAS call.
> + * @area: Caller-provided work area buffer for results.
> + * @srcID: Source ID returned by the RTAS call.
> + * @bytesw: Bytes written by RTAS call to @area.
> + */
> +static int rtas_ibm_receive_hvpipe_msg(struct rtas_work_area *area,
> +					u32 *srcID, u32 *bytesw)
> +{
> +	const s32 token = rtas_function_token(RTAS_FN_IBM_RECEIVE_HVPIPE_MSG);
> +	u32 rets[2];
> +	s32 fwrc;
> +	int ret;
> +
> +	if (token == RTAS_UNKNOWN_SERVICE)
> +		return -ENOENT;
> +
> +	do {
> +		fwrc = rtas_call(token, 2, 3, rets,
> +				rtas_work_area_phys(area),
> +				rtas_work_area_size(area));
> +
> +	} while (rtas_busy_delay(fwrc));
> +
> +	switch (fwrc) {
> +	case RTAS_SUCCESS:
> +		*srcID = rets[0];
> +		*bytesw = rets[1];
> +		ret = 0;
> +		break;
> +	case RTAS_HARDWARE_ERROR:
> +		ret = -EIO;
> +		break;
> +	case RTAS_INVALID_PARAMETER:
> +		ret = -EINVAL;
> +		break;
> +	case RTAS_FUNC_NOT_SUPPORTED:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	default:
> +		ret = -EIO;
> +		pr_err_ratelimited("unexpected ibm,receive-hvpipe-msg status %d\n", fwrc);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * ibm,send-hvpipe-msg RTAS call
>   * @area: Caller-provided work area buffer to send.
> @@ -116,9 +164,60 @@ static struct hvpipe_source_info *hvpipe_find_source(u32 srcID)
>  	return NULL;
>  }
>  
> +/*
> + * This work function collects receive buffer with recv HVPIPE
> + * RTAS call. Called from read()
> + * @buf: User specified buffer to copy the payload that returned
> + *       from recv HVPIPE RTAS.
> + * @size: Size of buffer user passed.
> + */
> +static int hvpipe_rtas_recv_msg(char __user *buf, int size)
> +{
> +	struct rtas_work_area *work_area;
> +	u32 srcID, bytes_written;
> +	int ret;
> +
> +	work_area = rtas_work_area_alloc(SZ_4K);
> +	if (!work_area) {
> +		pr_err("Could not allocate RTAS buffer for recv pipe\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = rtas_ibm_receive_hvpipe_msg(work_area, &srcID,
> +					&bytes_written);
> +	if (!ret) {
> +		/*
> +		 * Recv HVPIPE RTAS is successful.
> +		 * When releasing FD or no one is waiting on the
> +		 * specific source, issue recv HVPIPE RTAS call
> +		 * so that pipe is not blocked - this func is called
> +		 * with NULL buf.
> +		 */
> +		if (buf) {
> +			if (size < bytes_written) {
> +				pr_err("Received the payload size = %d, but the buffer size = %d\n",
> +					bytes_written, size);
> +				bytes_written = size;
> +			}
> +			ret = copy_to_user(buf,
> +					rtas_work_area_raw_buf(work_area),
> +					bytes_written);
> +			if (!ret)
> +				ret = bytes_written;
> +		}
> +	} else {
> +		pr_err("ibm,receive-hvpipe-msg failed with %d\n",
> +				ret);
> +	}
> +
> +	rtas_work_area_free(work_area);
> +	return ret;
> +}
> +
>  /*
>   * papr_hvpipe_handle_write -  Issue send HVPIPE RTAS and return
> - * the RTAS status to the user space
> + * the size (payload + HVPIPE_HDR_LEN) for RTAS success.
> + * Otherwise returns the status of RTAS to the user space
>   */
>  static ssize_t papr_hvpipe_handle_write(struct file *file,
>  	const char __user *buf, size_t size, loff_t *off)
> @@ -217,11 +316,72 @@ static ssize_t papr_hvpipe_handle_read(struct file *file,
>  {
>  
>  	struct hvpipe_source_info *src_info = file->private_data;
> +	struct papr_hvpipe_hdr hdr;
> +	long ret;
>  
>  	if (!src_info)
>  		return -EIO;
>  
> -	return 0;
> +	/*
> +	 * Max payload is 4048 (HVPIPE_MAX_WRITE_BUFFER_SIZE)
> +	 */
> +	if ((size > (HVPIPE_HDR_LEN + HVPIPE_MAX_WRITE_BUFFER_SIZE)) ||
> +		(size < HVPIPE_HDR_LEN))
> +		return -EINVAL;
> +
> +	/*
> +	 * Payload is not available to receive or source pipe
> +	 * is not closed.
> +	 */
> +	if (!src_info->hvpipe_status)
> +		return 0;
> +
> +	hdr.version = 0;
> +	hdr.flags = 0;
> +
> +	/*
> +	 * In case if the hvpipe has payload and also the
> +	 * hypervisor closed the pipe to the source, retrieve
> +	 * the payload and return to the user space first and
> +	 * then notify the userspace about the hvpipe close in
> +	 * next read().
> +	 */
> +	if (src_info->hvpipe_status & HVPIPE_MSG_AVAILABLE)
> +		hdr.flags = HVPIPE_MSG_AVAILABLE;
> +	else if (src_info->hvpipe_status & HVPIPE_LOST_CONNECTION)
> +		hdr.flags = HVPIPE_LOST_CONNECTION;
> +	else
> +		/*
> +		 * Should not be here without one of the above
> +		 * flags set
> +		 */
> +		return -EIO;
> +
> +	ret = copy_to_user(buf, &hdr, HVPIPE_HDR_LEN);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Message event has payload, so get the payload with
> +	 * recv HVPIPE RTAS.
> +	 */
> +	if (hdr.flags & HVPIPE_MSG_AVAILABLE) {
> +		ret = hvpipe_rtas_recv_msg(buf + HVPIPE_HDR_LEN,
> +				size - HVPIPE_HDR_LEN);
> +		if (ret > 0) {
> +			src_info->hvpipe_status &= ~HVPIPE_MSG_AVAILABLE;
> +			ret += HVPIPE_HDR_LEN;
> +		}
> +	} else if (hdr.flags & HVPIPE_LOST_CONNECTION) {
> +		/*
> +		 * Hypervisor is closing the pipe for the specific
> +		 * source. So notify user space.
> +		 */
> +		src_info->hvpipe_status &= ~HVPIPE_LOST_CONNECTION;
> +		ret = HVPIPE_HDR_LEN;
> +	}
> +
> +	return ret;
>  }

Looks good to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.


