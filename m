Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8604B5DD02
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 05:31:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dmqj0gxtzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 13:31:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dmp25BTvzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 13:30:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRjt+a2S"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45dmp22SVZz8xD3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 13:30:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45dmp22Fv7z9s8m; Wed,  3 Jul 2019 13:30:18 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRjt+a2S"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45dmp15sRXz9s3Z
 for <linuxppc-dev@ozlabs.org>; Wed,  3 Jul 2019 13:30:16 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id b7so411703pls.6
 for <linuxppc-dev@ozlabs.org>; Tue, 02 Jul 2019 20:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=MVLDXqQRcdyFTbrjx+tYpHiLe/KpOcxmbHPx54X9ZVs=;
 b=nRjt+a2Sd4duikxK3b1OcFdhn5nbpwsnbVselGgYouBCJJOAK7UUXh6MU9JQ+4KA1l
 qEKaf87z0yR49UI9/x4sAcZ/5Frnl1M1pc+AxM5tjv54ewGe2GHNFehyprDDj+dkWAe+
 u6GrU5RTyhNnT+m21P8a8KKB/gtUqfw0sGblpfYlRiF4qy1CWEyvTTFtHg3AJroyFWcF
 tRUwRJ27WRQ9oxvFCq7sPLyQ/cwkxTHBdkm/m4qPzyPckqwdOGL4gm2rplausI1L2Ykg
 fG/jP3pzJ7rajZyUsWWTb+HW3cneOTwr9xnQtb6u5NbHuRZ/SNIcTVjWrGgztsJn2VO1
 xQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=MVLDXqQRcdyFTbrjx+tYpHiLe/KpOcxmbHPx54X9ZVs=;
 b=uIJFs4Un8I9qbbXEwzu7bfurrPDU7SoUA3F+kmFh7Q6U2HAh6EPfugk+1eFnyiPZEu
 kzasVa3nDK5O1ahOsDZkjQamBR+vXKPFRvNuCx0743h62TvLdwNhI1wLRxD2ChpwzbXk
 h/6JzVaXrEyLD1fPqRiX23oM+qNp7IT2Kgh2KRx5O2zSRSV6xGLhvPer/87jCcERiyEk
 PqvLj3uUmvDg+fXyE1MhHS2nwiEZVPIAygsDn/PSM/KnmM/DVh5zbwPXlLFbPtGzFPbm
 pPzh37LAkzWfT//Uum8oup8MMtJgIBeqcTU3Y2pG+gZJXxJESHUHdtUtRkqL4G5hoLhG
 i2ew==
X-Gm-Message-State: APjAAAWqe4Wr4OZ014FmfPaBOOOOrO3k4KUp6hzxl82BWySarTx5Kdng
 60DriVs5bKCOiE2WI9VEZwA=
X-Google-Smtp-Source: APXvYqwSowNWrTAzm5BTc1aI4v4tZSlO/Co0EpESubDd1+iBiLPdXQuy4KmHYxUFKsoivkwGdH7EYw==
X-Received: by 2002:a17:902:3225:: with SMTP id
 y34mr38481872plb.135.1562124613795; 
 Tue, 02 Jul 2019 20:30:13 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id q4sm420264pjq.27.2019.07.02.20.30.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 20:30:13 -0700 (PDT)
Message-ID: <5f4b28e4df2049506a9fa03eead6cfbad9d7cdf3.camel@gmail.com>
Subject: Re: [PATCH v3 01/16] powerpc/fadump: move internal fadump code to a
 new file
From: Oliver O'Halloran <oohall@gmail.com>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@ozlabs.org>
Date: Wed, 03 Jul 2019 13:30:07 +1000
In-Reply-To: <156149554689.9094.13274886908174068943.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
 <156149554689.9094.13274886908174068943.stgit@hbathini.in.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.3 (3.32.3-1.fc30) 
MIME-Version: 1.0
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-26 at 02:15 +0530, Hari Bathini wrote:
> Refactoring fadump code means internal fadump code is referenced from
> different places. For ease, move internal code to a new file.

Can you elaborate a bit? I don't really get what the difference between
fadump and fadump-internal code is supposed to be. Why can't all this
just live in fadump.c?


