Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B3284A137
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 18:46:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=REF9Y7sz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTDMl6kvJz3bNs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 04:46:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=REF9Y7sz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=htejun@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTDLy4Kzzz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 04:46:01 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-295c67ab2ccso3421663a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Feb 2024 09:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707155156; x=1707759956; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tWpkA0adWfJg/N96ugMkWhlTX4/Zx12uY2WHwPaeRnA=;
        b=REF9Y7sz2guFVR/OH4Wzg+H1+b26tRUnSbLqckxku+xDqRBDY9JEyZNtO3KDF8Lx9Z
         bFGypyAWPKAPKyfBYCG8RLMwciMh2eDQ/LHPpXQh8lZrweSZFmgfXrPwn6IV6APZlYHF
         4VHC6S9wZ/2vdf2JjwHy4M7Hleyyw6bXyu71woL7xaUFXQTk4Ky3OrKKUpBl5XOg5K0T
         Mz3RiPaJv1u2kOC2S0ghSSX9XWX6dcqzxjQyjp9gmMYP8PayHfstunlvoDVTCSeqqXPK
         0osNciebHijq7vMHrAlhwbxsydNA2ABaA7DJfJMR+y+0UpNx4mRKHVEEoVRvgQoxMMXF
         3MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155156; x=1707759956;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWpkA0adWfJg/N96ugMkWhlTX4/Zx12uY2WHwPaeRnA=;
        b=egRKVis23R4///cHYiCiWEhxg67eUrjuoBoI8SdAWK2RJop+4sYbJhl/RZi9rBbwNj
         QQOpdTZNBPHhZ35z9+GDqJPq1vej/LMXaox63lFJ8mxgUeusmenwGutw7O1NwDJWvEiC
         5m3qyfdxpnSwgZLz+XAtpy/qdcBBiUvE7WP+6oCHYTxQgqmNMzEXngYVl6mWLtSm/wB8
         OvDvR/ic35py7THJM7DTpuD2ptil91SV+/0IengVYhgMsR7LSrqJR7LHRfnvV1YdfVvl
         AP9r2XNS++7GLEO6tehoMHnHAI6p+M45BSsCVTJ9Uo/Bf3+6KImfNsvm+2sPs/4Re503
         LI2w==
X-Gm-Message-State: AOJu0YyWbPF8Ss+nfnwNNKQ9UhtmsawCzhZ4lrmbgWHPawCHfEhimxWY
	Q9au2hoyA/VJJ7FFG3jD+RUEDmpMtpHZ17W2j4t8AZoEAM8sa/t/
X-Google-Smtp-Source: AGHT+IEqEmWKxapPmLXYmOp2uW9MmgZudDXICGNoo85jUNcxH4rxgZoagf5UZXbl3QwCCMxY73PBsw==
X-Received: by 2002:a17:90b:3647:b0:296:3a5:6fb8 with SMTP id nh7-20020a17090b364700b0029603a56fb8mr140155pjb.25.1707155156241;
        Mon, 05 Feb 2024 09:45:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUUTj4d9BneUR8TZxAaWCjiW0qPu4NyC9O0WiMqD0EHnQyDK/qEVa141FY7qkYuJnDqIDgdelFh/eE6OODkrU1xkP6MwGo1Rt4S8atEe92QUmNAC4qwcKL6NjLrhFpAbdAtuF4tZ0iSPFhZcNJvztJ+Oif6QDoKQP+woOxB+gNeACViotwAWvKQ0yEAcmkFw6aRy0M9Ahg5aX4o4dnA7tXBTiZpTGFAGhd8wEkpw6VdnFx9tIorsXqvjsSZM3byxJdSkfgWlHNoa2Rt7mZHKCmZd8B0Rl3ygArty1j/RFdt8876/3tNc2YGX3rrQMJvrU0/rpAaTe9J7N8PErxAllclAaSxa8IWv3bbiamB+yG6CkYt8W/2bY/qXRTgYWOTC7IJNdON29VtTP5MmAeDIzalabi2qUF44plo4wSA44LtuJfXkg==
Received: from localhost (dhcp-141-239-144-21.hawaiiantel.net. [141.239.144.21])
        by smtp.gmail.com with ESMTPSA id lc4-20020a170902fa8400b001d8e41b3f95sm141669plb.51.2024.02.05.09.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:45:55 -0800 (PST)
Date: Mon, 5 Feb 2024 07:45:54 -1000
From: Tejun Heo <tj@kernel.org>
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: Re: [Bisected] [commit dd6c3c544126] [linux-next] [6.8.0-rc2] Task
 hungs for infinite time call traces
Message-ID: <ZcEe0q8Bg5zca1nA@slm.duckdns.org>
References: <a95f5bcd-3c49-4ebd-b1b3-a688c5b6727c@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a95f5bcd-3c49-4ebd-b1b3-a688c5b6727c@linux.vnet.ibm.com>
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
Cc: "sachinp@linux.vnet.com" <sachinp@linux.vnet.com>, "mputtash@linux.vnet.com" <mputtash@linux.vnet.com>, jiangshanlai@gmail.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "abdhalee@linux.vnet.ibm.com" <abdhalee@linux.vnet.ibm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-arm-msm@vger.kernel.org, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, Feb 05, 2024 at 03:24:17PM +0530, Tasmiya Nalatwad wrote:
> Greetings,
> 
> [Linux-next] [6.8.0-rc2-next-20240130] [FC / XFS] Task hangs for infinite
> time while running bonnie test XFS filesystem
> 
> Bisected the issue. Git bisect points to the below commit
> commit dd6c3c5441263723305a9c52c5ccc899a4653000
>           workqueue: Move pwq_dec_nr_in_flight() to the end of work item
> handling

This should be fixed by c70e1779b73a ("Fix pwq->nr_in_flight corruption in
try_to_grab_pending()").

Thanks.

-- 
tejun
