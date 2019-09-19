Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A16B6FDC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 02:07:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ycbt6r9yzF4nq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 10:07:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=arnaldo.melo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F7fu/kCd"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YcYv3kC4zF4gq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 10:05:38 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id r5so2044913qtd.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 17:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NBGDkciQM96PlADwiS6Ecn8jjQWg9GBn83vtaVwDbH4=;
 b=F7fu/kCdJpx4U0F7B82qRuisn7vshNg319dix7xkITNkq8ZJUHoY78k/2wG8bc5a0p
 2rsBNZ2L2VcRGViAUVMaIlCWStcCG+MSZtQBmMnix7zq0P3NbDWk++QjZsGwLmWnSMdU
 hiaI0toddG/o78kORuJVD07nhuKEctHF7MhFajLYZykQUfzz4Pq+aFVRUPPKab5deUYR
 JYyd9VBoIhk1GHu3Gz/h2/HH7yZV2ItCpEp+M4HHH/SLlM8V9vrNeNI2Eg7fb8lN+54Y
 WqAqVHRDXBIhcR0pHOuxJSSvdQIkEnuL/8+PzmsmxP1Ih8LEeKDDFMmj7LH8O5Cq7mKM
 InQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NBGDkciQM96PlADwiS6Ecn8jjQWg9GBn83vtaVwDbH4=;
 b=bXLEwAYopAwQlFMQI2T3yCrQw8AAjAlf5XB+0IcYsKH3lP9eHa/GYcz2q4S+HpnLX2
 jXzlbFaYLLPlQdOZOPUpYLiNlq/ALPrayiYE1LqbifHj/sdHghdZdM2CKo9YcKjw1Hio
 A7tlZaYYnYv0L/1712TY895G4zdadbmRIa/hPcJNQb7Qw5LOF5e2ogdc1DptynWeWk+a
 YLbpdz62YVgY7zJ56flmvjOVDSCg7yCrmEHKHDXNPD7AV/HQWFmFKdE2YVfs+d2htR8v
 GT57WlCM3OITRJbdJoxchkYdY2s2hKgYWNmahQRQxmfsYC0XpY6j5k53Brw9+kn1fX3h
 Iy4A==
X-Gm-Message-State: APjAAAX6ivs1E/0XDdWpKTke/JMTcSbQB9jJECD96PJbc5dVMYCUHczR
 7ratzw3tXbC7CetKKjA+UZk=
X-Google-Smtp-Source: APXvYqwwvzYOGL92W3RbDuk2kMUHSwL/Jadn9bIMbGiMngW0Upv5wZjaWKRWMI3xC8w2fPTrEQy11g==
X-Received: by 2002:aed:3f7d:: with SMTP id q58mr433021qtf.347.1568851536003; 
 Wed, 18 Sep 2019 17:05:36 -0700 (PDT)
Received: from quaco.ghostprotocols.net ([179.97.35.50])
 by smtp.gmail.com with ESMTPSA id g3sm3655700qkb.117.2019.09.18.17.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 17:05:35 -0700 (PDT)
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
 id 8A55C40340; Wed, 18 Sep 2019 21:05:32 -0300 (-03)
Date: Wed, 18 Sep 2019 21:05:32 -0300
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] tools/perf: Move kvm-stat header file from
 conditional inclusion to common include section
Message-ID: <20190919000532.GE32051@kernel.org>
References: <20190718181749.30612-1-anju@linux.vnet.ibm.com>
 <1afefd12-b9c5-77b6-c371-bef9fd6f788b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1afefd12-b9c5-77b6-c371-bef9fd6f788b@linux.ibm.com>
X-Url: http://acmel.wordpress.com
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: maddy@linux.vnet.ibm.com, peterz@infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 alexander.shishkin@linux.intel.com, Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 namhyung@kernel.org, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Em Fri, Jul 19, 2019 at 10:58:37AM +0530, Ravi Bangoria escreveu:
> 
> LGTM. For the series,
> 
> Reviewed-By: Ravi Bangoria <ravi.bangoria@linux.ibm.com>


Thanks, applied.

- Arnaldo
