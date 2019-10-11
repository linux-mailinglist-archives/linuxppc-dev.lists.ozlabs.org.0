Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD4CD4117
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 15:26:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46qTHt1MMWzDqZD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2019 00:26:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46qT6h3C6zzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 00:18:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46qT6f0w5mz8t81
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2019 00:18:34 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46qT6d3DMrz9sP6; Sat, 12 Oct 2019 00:18:33 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46qT6c598wz9sNx
 for <linuxppc-dev@ozlabs.org>; Sat, 12 Oct 2019 00:18:32 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9BD9CFG046592
 for <linuxppc-dev@ozlabs.org>; Fri, 11 Oct 2019 09:18:30 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vjqre745p-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 11 Oct 2019 09:18:29 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <zohar@linux.ibm.com>;
 Fri, 11 Oct 2019 14:18:27 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 11 Oct 2019 14:18:22 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9BDIK0T35848280
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Oct 2019 13:18:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4B0711C06E;
 Fri, 11 Oct 2019 13:18:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EEF711C05B;
 Fri, 11 Oct 2019 13:18:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.178.57])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 11 Oct 2019 13:18:18 +0000 (GMT)
Subject: Re: [PATCH v7 6/8] certs: add wrapper function to check blacklisted
 binary hash
From: Mimi Zohar <zohar@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Date: Fri, 11 Oct 2019 09:18:17 -0400
In-Reply-To: <1570497267-13672-7-git-send-email-nayna@linux.ibm.com>
References: <1570497267-13672-1-git-send-email-nayna@linux.ibm.com>
 <1570497267-13672-7-git-send-email-nayna@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101113-0028-0000-0000-000003A92DAB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101113-0029-0000-0000-0000246B3A28
Message-Id: <1570799897.5250.79.camel@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910110124
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver
 O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-10-07 at 21:14 -0400, Nayna Jain wrote:
> The existing is_hash_blacklisted() function returns -EKEYREJECTED
> error code for both the blacklisted keys and binaries.
> 
> This patch adds a wrapper function is_binary_blacklisted() to check
> against binary hashes and returns -EPERM.    
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>

This patch description describes what you're doing, not the
motivation.

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

> ---
>  certs/blacklist.c             | 9 +++++++++
>  include/keys/system_keyring.h | 6 ++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/certs/blacklist.c b/certs/blacklist.c
> index ec00bf337eb6..6514f9ebc943 100644
> --- a/certs/blacklist.c
> +++ b/certs/blacklist.c
> @@ -135,6 +135,15 @@ int is_hash_blacklisted(const u8 *hash, size_t hash_len, const char *type)
>  }
>  EXPORT_SYMBOL_GPL(is_hash_blacklisted);
>  
> +int is_binary_blacklisted(const u8 *hash, size_t hash_len)
> +{
> +	if (is_hash_blacklisted(hash, hash_len, "bin") == -EKEYREJECTED)
> +		return -EPERM;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(is_binary_blacklisted);
> +
>  /*
>   * Initialise the blacklist
>   */
> diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
> index c1a96fdf598b..fb8b07daa9d1 100644
> --- a/include/keys/system_keyring.h
> +++ b/include/keys/system_keyring.h
> @@ -35,12 +35,18 @@ extern int restrict_link_by_builtin_and_secondary_trusted(
>  extern int mark_hash_blacklisted(const char *hash);
>  extern int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>  			       const char *type);
> +extern int is_binary_blacklisted(const u8 *hash, size_t hash_len);
>  #else
>  static inline int is_hash_blacklisted(const u8 *hash, size_t hash_len,
>  				      const char *type)
>  {
>  	return 0;
>  }
> +
> +static inline int is_binary_blacklisted(const u8 *hash, size_t hash_len)
> +{
> +	return 0;
> +}
>  #endif
>  
>  #ifdef CONFIG_IMA_BLACKLIST_KEYRING

