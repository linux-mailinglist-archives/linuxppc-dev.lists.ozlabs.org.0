Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AC6592B07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 10:49:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5nz36TYwz3cMr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 18:49:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgRUC6WR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgRUC6WR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgRUC6WR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgRUC6WR;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5lRP6Vzyz2xJG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 16:55:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660546543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s27ZkPXAKFlLDtakqNA0q70iNz46u3nf8VUdJxUpsDw=;
	b=TgRUC6WRq1zc0FwtNFq/RCysKoczEOiTKab4LxoI02V76iEAHI9oSSBd/EIDdnPQCBo12X
	EybE0A0QvWF85f+g+EHWCxR6/tkjCfkyAcGj57CqhIZ+35gmotRV9kItR+UFoEYeqGzTA4
	VzkHJnfZlBHIeOS679E6oTcaOWSLKOY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660546543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s27ZkPXAKFlLDtakqNA0q70iNz46u3nf8VUdJxUpsDw=;
	b=TgRUC6WRq1zc0FwtNFq/RCysKoczEOiTKab4LxoI02V76iEAHI9oSSBd/EIDdnPQCBo12X
	EybE0A0QvWF85f+g+EHWCxR6/tkjCfkyAcGj57CqhIZ+35gmotRV9kItR+UFoEYeqGzTA4
	VzkHJnfZlBHIeOS679E6oTcaOWSLKOY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-ieKdgLWeNnGX2vLMLSpE1A-1; Mon, 15 Aug 2022 02:55:39 -0400
X-MC-Unique: ieKdgLWeNnGX2vLMLSpE1A-1
Received: by mail-pg1-f198.google.com with SMTP id h7-20020a636c07000000b0042971e3dc0cso425076pgc.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 23:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=s27ZkPXAKFlLDtakqNA0q70iNz46u3nf8VUdJxUpsDw=;
        b=3jGeNguOE4X3Kk2YszVYbq00IJEbmWzmulQkQy+gpYeCZzvuBn84xq6t9e6gv2FXoQ
         onof83KJWHep4PJ0mxKT6n2aLxDLEFYbnsW6M8vysg7dwLHI73Nv4IJNX1PdTIkZH4/o
         3860D/Xl5/hECXyb5HEO7Mxp5D5l4LQyuTT9vPKeoYOB1jfnSX5FePHmatnsBq5YhQzD
         wMHRXhP2RoN1auVNbblmAKjbRDosbGmWjiiCPi6zoXajhVePqxvxra5ivFo8Bz6K5AJV
         3YHJhX8xJQ9nC4WHzSfuIg5o79QbsoFsXX6E83/9mLJZqpSWjc9stOCeqOrHBP5ALzH7
         OEgw==
X-Gm-Message-State: ACgBeo1DX9hzY80EtjeMWQwkFvn6sgYuHEIW7ctIlgu/A2kjSqtRsb+b
	Y2D5IMSgmlcvjhAf22h3A2AkieVF0WuQsLHl03dKfbPtpYATPsNeKPPKOVfp+Qmjx5g0CI8VrWC
	UlRvEGJfrKy4DBw5IF0msG9++rA==
X-Received: by 2002:a17:90a:5888:b0:1f5:f1d2:54bb with SMTP id j8-20020a17090a588800b001f5f1d254bbmr25854871pji.178.1660546538523;
        Sun, 14 Aug 2022 23:55:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5gSneUL2Qdvf4jY+Km6lnQKEAMNgjtedDGxytTE89P2b0LLUeE3NqKVwS7DQzMiYmV23B6Fg==
X-Received: by 2002:a17:90a:5888:b0:1f5:f1d2:54bb with SMTP id j8-20020a17090a588800b001f5f1d254bbmr25854861pji.178.1660546538288;
        Sun, 14 Aug 2022 23:55:38 -0700 (PDT)
Received: from localhost ([240e:3a1:2ea:acc0:8cff:e01c:2dbf:2ae8])
        by smtp.gmail.com with ESMTPSA id l20-20020a17090b079400b001f89383d587sm4015601pjz.56.2022.08.14.23.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:55:37 -0700 (PDT)
Date: Mon, 15 Aug 2022 14:53:25 +0800
From: Coiby Xu <coxu@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v7 0/6] tpm: Preserve TPM measurement log across kexec
 (ppc64)
Message-ID: <20220815065325.h3t3igr6nogf7h23@Rk>
References: <20220812164305.2056641-1-stefanb@linux.ibm.com>
 <20220815064813.77g6icbkygrbmapa@Rk>
MIME-Version: 1.0
In-Reply-To: <20220815064813.77g6icbkygrbmapa@Rk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 15 Aug 2022 18:48:38 +1000
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
Cc: devicetree@vger.kernel.org, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 15, 2022 at 02:48:13PM +0800, Coiby Xu wrote:
>I can confirm this patch set fixes an issue that guest kdump kernel
>crashes on POWER9 host by applying it to 5.19.1 (there is a conflict
>when applying this patch set to latest kernel i.e. 6.0.0-rc1).

FYI, here's the error of applying it to 6.0.0-rc1,

[root@localhost linux]# git am ../v7_tpm_log.mbox 
Applying: of: check previous kernel's ima-kexec-buffer against memory bounds
error: patch failed: drivers/of/kexec.c:126
error: drivers/of/kexec.c: patch does not apply
Patch failed at 0001 of: check previous kernel's ima-kexec-buffer against memory bounds
hint: Use 'git am --show-current-patch=diff' to see the failed patch

-- 
Best regards,
Coiby

