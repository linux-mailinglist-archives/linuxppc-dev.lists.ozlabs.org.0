Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF92FE0D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 05:38:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLqQk3PH6zDqwv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 15:38:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=sandipan.osd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LKYthmYA; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLqNr5ZRtzDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 15:36:57 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id g15so808738pjd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 20:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TfEmAAiyDB/oqglT1hIPi1fjGNmhPYZyPkxzw1qyOWU=;
 b=LKYthmYAk3OnwOk87qNtSNBLiYRHClSp0qzDajjKTT0VXQDPDcNgCgyktyPe/IcEEO
 A+m12zmdg76vXsHEimHokz9hW2Z/EcsMliotutEvFqyeMGJkkay/onyMRXXxDZ4+sKqu
 Fx/TPHmktTiJHT9cGpIJ7tEMrF1p0vzv29LhDlcQLgzaBBCuFPjftLqrQJc1OMUbpjhb
 Cg44kYkyt/uaUDbP1oHptKqYwsGO+c3ZWitHCf0BcjFdm79DUoBnOHAxNe/Hab6cdYSt
 5rU0xeq95ZnEjU1HKQrnidQzztwGOG/mQBQqoMPD41X/FZTTqwOaL/R4V85GXuGE4trS
 usrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TfEmAAiyDB/oqglT1hIPi1fjGNmhPYZyPkxzw1qyOWU=;
 b=lqa7BoAXUyV1sOH7cBn3B4pJN0nWNzRbSpVUpDWsJa0cvmId1/2apk8wvc5EoclofV
 BTCKkFcfYTMsxJ9Y41ZqfxAIbHwH1Zv6CeJ/5RNfRMPbQig7AFieKfsl/ac9hcM6i4vf
 6CWxRlMfiDWki3GYfV42bxdOKz688qISlD0dl4Pc4L9TNXHljW+go6gR8l97A1eTZREo
 0+D3KMBm9sTgzJbadH3v7ZeoDLCP3dg383tfQk/qlJSJT5Qt1yjGm5FFaywL6LTMTxin
 MTKHtfVvVlNEvwZ71vLLepfqlfI0Yo4ba5YeVdbVUGNcXbq8iXryL7Kc8XUbL2X2k2jp
 vTpA==
X-Gm-Message-State: AOAM530oyKWRLdEao9W/ZzwLXA3NEpNOC0NPJfbVhlaruSLK5TY0vUya
 l4B0HU4eUlzQK6DW32s5zpQ=
X-Google-Smtp-Source: ABdhPJxGoicUsJSfcaGSvOMxVu94xHztbdaAjXU72ic8g3veKYL5okhMiHnTiQsHKJk0u5sofrnOww==
X-Received: by 2002:a17:90a:af88:: with SMTP id
 w8mr9423355pjq.91.1611203813023; 
 Wed, 20 Jan 2021 20:36:53 -0800 (PST)
Received: from [192.168.0.102] ([45.64.236.150])
 by smtp.gmail.com with ESMTPSA id c17sm3622546pfi.88.2021.01.20.20.36.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 20:36:52 -0800 (PST)
Subject: Re: [PATCH v3] [PATCH] powerpc/sstep: Check ISA 3.0 instruction
 validity before emulation
To: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
References: <161114113785.214433.12934683302522893921.stgit@thinktux.local>
From: Sandipan Das <sandipan.osd@gmail.com>
Message-ID: <01bfa586-59b0-ed62-087c-472e0a7aaf0b@gmail.com>
Date: Thu, 21 Jan 2021 10:06:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161114113785.214433.12934683302522893921.stgit@thinktux.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: naveen.n.rao@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 20/01/21 4:43 pm, Ananth N Mavinakayanahalli wrote:
> We currently unconditionally try to emulate newer instructions on older
> Power versions that could cause issues. Gate it.
> 
> Signed-off-by: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
> ---
> 
> [v3] Addressed Naveen's comments on scv and addpcis
> [v2] Fixed description
> 
>  arch/powerpc/lib/sstep.c |   46 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
