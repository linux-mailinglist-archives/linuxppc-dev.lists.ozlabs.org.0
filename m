Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835455BC13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 23:12:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX0md2PmXz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 07:12:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=boSSFRYv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=dave.hansen@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=boSSFRYv;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX0m10hltz2ywr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 07:11:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656364321; x=1687900321;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UY4ciCF2PfXCTOF3LZITbZsRaQFQCfpZuDqHJ3No5q8=;
  b=boSSFRYvoouRDfMrCciH7m/SiyZmFjLwoXfRLNHYWm65dHH4Myi+FSY2
   84JMM4LGdFKZcbRzPd6EBWlM2hgwKa3IZcPrpt3tLu6f9GHWDnnxsgVtw
   5V0MFeEsNFDWe3gFKp92GJhgvVXV7wr5zg/A/Pp59Ijy7bhcqrYJ+hBt8
   WmsfeHzAo6nOKFQJ1hs0yGvJqa7YJlw/ClM2QUTBaFEIYLWVVycNkHZzd
   /Bo7bKFQJqQCH3bltcjjNNdo53AAnaeWi0ckhOFFjZYVf/+ICKjIBLE52
   YaXS9ZUNmELMbHZzRU+HETD2wEikjiQU+dnxi4QdqmPMdEInEyPHkv43L
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="280324385"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="280324385"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 14:11:52 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="732480739"
Received: from jsagoe-mobl1.amr.corp.intel.com (HELO [10.209.12.66]) ([10.209.12.66])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 14:11:52 -0700
Message-ID: <7abba0a4-2480-18a1-4d9c-5973bb97b059@intel.com>
Date: Mon, 27 Jun 2022 14:10:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH v2 0/3] powerpc/pseries: add support for local secure
 storage called Platform KeyStore(PKS)
Content-Language: en-US
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-fsdevel@vger.kernel.org
References: <20220622215648.96723-1-nayna@linux.ibm.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <20220622215648.96723-1-nayna@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, linux-efi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dov Murik <dovmurik@linux.ibm.com>, linux-security-module <linux-security-module@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, George Wilson <gcwilson@linux.ibm.com>, gjoyce@ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/22/22 14:56, Nayna Jain wrote:
> * Renamed PKS driver to PLPKS to avoid naming conflict as mentioned by
> Dave Hanson.

Thank you for doing this!  The new naming looks much less likely to
cause confusion.
