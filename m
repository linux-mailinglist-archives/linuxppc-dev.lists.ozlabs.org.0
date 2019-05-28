Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A29DD2CF6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 21:26:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45D3kM1nXLzDqQV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 05:26:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45D3hz3P0szDqJL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2019 05:25:39 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4SJPLvF133229
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 15:25:36 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ss9cdmh6u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 15:25:28 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bauerman@linux.ibm.com>;
 Tue, 28 May 2019 20:23:30 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 28 May 2019 20:23:25 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4SJNOSg34275810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 May 2019 19:23:24 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59697AE05C;
 Tue, 28 May 2019 19:23:24 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BF17AE060;
 Tue, 28 May 2019 19:23:20 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.218.160])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 28 May 2019 19:23:20 +0000 (GMT)
References: <20190418035120.2354-1-bauerman@linux.ibm.com>
 <20190418035120.2354-10-bauerman@linux.ibm.com>
 <1557442868.10635.87.camel@linux.ibm.com>
User-agent: mu4e 1.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v10 09/12] ima: Implement support for module-style
 appended signatures
In-reply-to: <1557442868.10635.87.camel@linux.ibm.com>
Date: Tue, 28 May 2019 16:23:16 -0300
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19052819-0060-0000-0000-00000348F66C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011176; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01209920; UDB=6.00635634; IPR=6.00990949; 
 MB=3.00027089; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-28 19:23:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19052819-0061-0000-0000-000049888DD2
Message-Id: <87zhn65qor.fsf@morokweng.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-28_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905280121
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
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Mimi Zohar <zohar@linux.ibm.com> writes:

> Hi Thiago,
>
>> diff --git a/security/integrity/ima/ima_policy.c b/security/integrity/ima/ima_policy.c
>> index fca7a3f23321..a7a20a8c15c1 100644
>> --- a/security/integrity/ima/ima_policy.c
>> +++ b/security/integrity/ima/ima_policy.c
>> @@ -1144,6 +1144,12 @@ void ima_delete_rules(void)
>>  	}
>>  }
>>
>> +#define __ima_hook_stringify(str)	(#str),
>> +
>> +const char *const func_tokens[] = {
>> +	__ima_hooks(__ima_hook_stringify)
>> +};
>> +
>>  #ifdef	CONFIG_IMA_READ_POLICY
>>  enum {
>>  	mask_exec = 0, mask_write, mask_read, mask_append
>> @@ -1156,12 +1162,6 @@ static const char *const mask_tokens[] = {
>>  	"MAY_APPEND"
>>  };
>>
>> -#define __ima_hook_stringify(str)	(#str),
>> -
>> -static const char *const func_tokens[] = {
>> -	__ima_hooks(__ima_hook_stringify)
>> -};
>> -
>>  void *ima_policy_start(struct seq_file *m, loff_t *pos)
>>  {
>>  	loff_t l = *pos;
>
> Is moving this something left over from previous versions or there is
> a need for this change?

Well, it's not a strong need, but it's still relevant in the current
version. I use func_tokens in ima_read_modsig() in order to be able to
mention the hook name in mod_check_sig()'s error message:

In ima_read_modsig():

	rc = mod_check_sig(sig, buf_len, func_tokens[func]);

And in mod_check_sig():

		pr_err("%s: Module is not signed with expected PKCS#7 message\n",
		       name);

If you think it's not worth it to expose func_tokens, I can make
ima_read_modsig() pass a more generic const string such as "IMA modsig"
for example.

> Other than this, the patch looks good.

Nice!

--
Thiago Jung Bauermann
IBM Linux Technology Center

