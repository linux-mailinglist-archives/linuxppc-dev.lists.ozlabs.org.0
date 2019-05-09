Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA519591
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 01:04:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450TRx2g9hzDqRv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 09:04:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450TP44WsMzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 09:01:44 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x49MplnW130125
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 May 2019 19:01:40 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2scvyn11dx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 19:01:40 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <zohar@linux.ibm.com>;
 Fri, 10 May 2019 00:01:37 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 10 May 2019 00:01:32 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x49N1VD750659486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 May 2019 23:01:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE2FF4C044;
 Thu,  9 May 2019 23:01:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E739D4C040;
 Thu,  9 May 2019 23:01:29 +0000 (GMT)
Received: from dhcp-9-31-103-88.watson.ibm.com (unknown [9.31.103.88])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 May 2019 23:01:29 +0000 (GMT)
Subject: Re: [PATCH v10 11/12] ima: Define ima-modsig template
From: Mimi Zohar <zohar@linux.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linux-integrity@vger.kernel.org
Date: Thu, 09 May 2019 19:01:29 -0400
In-Reply-To: <20190418035120.2354-12-bauerman@linux.ibm.com>
References: <20190418035120.2354-1-bauerman@linux.ibm.com>
 <20190418035120.2354-12-bauerman@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050923-0020-0000-0000-0000033B164F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050923-0021-0000-0000-0000218DBF5D
Message-Id: <1557442889.10635.88.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905090130
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-doc@vger.kernel.org,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>,
 David Howells <dhowells@redhat.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 David Woodhouse <dwmw2@infradead.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-04-18 at 00:51 -0300, Thiago Jung Bauermann wrote:
> Define new "d-modsig" template field which holds the digest that is
> expected to match the one contained in the modsig, and also new "modsig"
> template field which holds the appended file signature.
> 
> Add a new "ima-modsig" defined template descriptor with the new fields as
> well as the ones from the "ima-sig" descriptor.
> 
> Change ima_store_measurement() to accept a struct modsig * argument so that
> it can be passed along to the templates via struct ima_event_data.
> 
> Suggested-by: Mimi Zohar <zohar@linux.ibm.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Thanks, Roberto.  Just some thoughts inline below.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

> ---

<snip>

> +/*
> + * Validating the appended signature included in the measurement list requires
> + * the file hash calculated without the appended signature (i.e., the 'd-modsig'
> + * field). Therefore, notify the user if they have the 'modsig' field but not
> + * the 'd-modsig' field in the template.
> + */
> +static void check_current_template_modsig(void)
> +{
> +#define MSG "template with 'modsig' field also needs 'd-modsig' field\n"
> +	struct ima_template_desc *template;
> +	bool has_modsig, has_dmodsig;
> +	static bool checked;
> +	int i;
> +
> +	/* We only need to notify the user once. */
> +	if (checked)
> +		return;
> +
> +	has_modsig = has_dmodsig = false;
> +	template = ima_template_desc_current();
> +	for (i = 0; i < template->num_fields; i++) {
> +		if (!strcmp(template->fields[i]->field_id, "modsig"))
> +			has_modsig = true;
> +		else if (!strcmp(template->fields[i]->field_id, "d-modsig"))
> +			has_dmodsig = true;
> +	}
> +
> +	if (has_modsig && !has_dmodsig)
> +		pr_notice(MSG);
> +
> +	checked = true;
> +#undef MSG
> +}
> +

There was some recent discussion about supporting per IMA policy rule
template formats.  This feature will allow just the kexec kernel image
to require ima-modsig.  When per policy rule template formats support
is upstreamed, this function will need to be updated.

<snip>
> 
> @@ -389,3 +425,25 @@ int ima_eventsig_init(struct ima_event_data *event_data,
>  	return ima_write_template_field_data(xattr_value, event_data->xattr_len,
>  					     DATA_FMT_HEX, field_data);
>  }
> +
> +int ima_eventmodsig_init(struct ima_event_data *event_data,
> +			 struct ima_field_data *field_data)
> +{
> +	const void *data;
> +	u32 data_len;
> +	int rc;
> +
> +	if (!event_data->modsig)
> +		return 0;
> +
> +	/*
> +	 * The xattr_value for IMA_MODSIG is a runtime structure containing
> +	 * pointers. Get its raw data instead.
> +	 */

"xattr_value"?  The comment needs some clarification.

Mimi

> +	rc = ima_modsig_serialize(event_data->modsig, &data, &data_len);
> +	if (rc)
> +		return rc;
> +
> +	return ima_write_template_field_data(data, data_len,
> +					     DATA_FMT_HEX, field_data);
> +}

