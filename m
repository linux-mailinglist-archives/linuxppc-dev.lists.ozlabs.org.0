Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A060972F2CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 04:49:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KejiIVIH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgqd13GBFz3bTb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 12:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KejiIVIH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=leo.yan@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgqc558mDz307h
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 12:48:19 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b3be39e666so24693325ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 19:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686710896; x=1689302896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k0YlFQAyWxbuL4Zsr4kr8EBosxhqQEgpBKxBIFTH5hE=;
        b=KejiIVIHfhPCnwN1mYw9NB3AagkSdpS+LUX00U7yMb0BZFE8CAriat8e/7Pa/YmPDW
         7N4n4SDA+y19EFfKUce9zSP0awfJ8ydt2d7Y4Kn4uTnseeQ/YMNbeH1XZjLv8FDsnemk
         JmhfAvWtrlCE9jXrHErOgjxgUJ3PIQHY3zHTXLbGNjnN/WdwwKw9HiG+FPJpcIfkZ0uX
         s8373Tzs4x5ddcaVnudyeXZ/ZiYzZO0c9sDHjkkJDR17NATD7IMBRjcnmQ8Z25j9+/Dg
         v/x/lJHFeLdQqBBmzB6QX/5FmhpF9xDtm3cJJad9p8SfCWJLel/d7qKqmMsimtUTpcT9
         byKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686710896; x=1689302896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0YlFQAyWxbuL4Zsr4kr8EBosxhqQEgpBKxBIFTH5hE=;
        b=hVzZmU7KK834tZhe0hYosGDGsnlUsMfSdQ/Zsppoy1060LA/B/3cDdDbNl4hLoTxty
         rNULZj+RU4uH2NZonvi93NfwjjQJA3mFPQBlHgo3cJcUklASqZ7Eag70kr8JVXxzCctO
         22tW6WoK8GuH0fcVdm9LACKLzhqZn9tGVZDOTNOK6dHr3FEntdEUG1yw11cudB589c9c
         bpTY+BhhrEFz6jClqg47GT9SB84eYmL9eiIJcTyy+Q82Sr/dGGcR0mwG/hk/P6xExQOp
         B24IrHHgUPSODZgvE76mdiPRPqAGRMtXUMPfLqDsYIEjcKuqXFoqf/JDrug+ML859lHI
         //7A==
X-Gm-Message-State: AC+VfDzVxMz/esBSt7PkdqbyD1bLmKkPloNEJeVb4DJ2HLY/fgKOUqZ5
	8uk2woQvm9q6uHfnJBdRS3AelQ==
X-Google-Smtp-Source: ACHHUZ6ErTAXlm3FfgIHNOscl4ATQNoo6KtiqunTj/PImDO4p4fi/ERgK1MRsNStbB3teZwD3dotxA==
X-Received: by 2002:a17:902:e744:b0:1b3:c4c1:ec4e with SMTP id p4-20020a170902e74400b001b3c4c1ec4emr402092plf.30.1686710895980;
        Tue, 13 Jun 2023 19:48:15 -0700 (PDT)
Received: from leoy-huanghe.lan (211-75-219-201.hinet-ip.hinet.net. [211.75.219.201])
        by smtp.gmail.com with ESMTPSA id r20-20020a170902be1400b001a9b29b6759sm10964697pls.183.2023.06.13.19.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 19:48:15 -0700 (PDT)
Date: Wed, 14 Jun 2023 10:48:10 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH 01/17] perf: get rid of unused import
Message-ID: <20230614024810.GM217089@leoy-huanghe.lan>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
 <20230613164145.50488-2-atrajeev@linux.vnet.ibm.com>
 <ZIjJYCL38UX9FIl4@kernel.org>
 <20230614015914.GL217089@leoy-huanghe.lan>
 <ZIknI2imecS5doHN@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIknI2imecS5doHN@kernel.org>
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
Cc: irogers@google.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, john.g.garry@oracle.com, kjain@linux.ibm.com, ravi.bangoria@amd.com, Sourabh Jain <sourabhjain@linux.ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 13, 2023 at 11:34:11PM -0300, Arnaldo Carvalho de Melo wrote:

[...]

> > Since have applied this patch, it's no need to give my review tag :)
> 
> No, I usually can  add a Reviewed-by tag even after having applied it to
> my local tree, as I still need to run tests before making it available
> via perf-tools-next, when I should not make any further changes.

Understand now.  Here is my review tag:

Reviewed-by: Leo Yan <leo.yan@linaro.org>
