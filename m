Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F95C39FC5D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 18:24:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzwYL5vYDz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:24:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.215.182;
 helo=mail-pg1-f182.google.com; envelope-from=bart.vanassche@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzwY03cv7z2xYp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 02:24:04 +1000 (AEST)
Received: by mail-pg1-f182.google.com with SMTP id i34so10501045pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Jun 2021 09:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tWUOLd7SDy3G4uRPATKyTli1+VRXa+Ne7jXYUe6DYzU=;
 b=lyRrQSB9GhapPmjgjtDwKXP9+sdzYnGbHKGFwJ1hkwKDhp+qIlagidjULK8owMwSBP
 aEvE5mbDRGI7cjsGfjv71YxCOp0CNgOIrnkt2649A1BwuHIt/aEM5192r5bzOZqhxEm6
 ScxozgSLxl2BfsZQ2Cd8q/Uq9L0GZbIxJ5Ao9HUu/IcMrZc0izJGLhi1l7LjH3Xr3jHC
 YIxQ71vvkA2lEaVFnk/yg/V4qkwS5DaCcyecI9KXqKY0VMprBTJkxl4LTAtIQiiWwrm+
 dnH1N+vwqxE2e/UOFPUuOLpxtZysK99//SlegN4f6AB5pyLGTc/m8kqoHLolFO5G004e
 wmCg==
X-Gm-Message-State: AOAM532ADcdPSaJevjtEVGSGF0Pble2RdtZnps2xMDd9PP1MxvZjPP4m
 6oXngMXSgGPCUOhbkIK1/ko=
X-Google-Smtp-Source: ABdhPJw8yHF55mrEwh6e92tzycqNf1F5E5W7MS3iqsvoqL7+Q6ralpXCJFS3XAL+JOxp8CFbvFr8pQ==
X-Received: by 2002:a05:6a00:170c:b029:2dc:dd8f:e083 with SMTP id
 h12-20020a056a00170cb02902dcdd8fe083mr663455pfc.77.1623169441463; 
 Tue, 08 Jun 2021 09:24:01 -0700 (PDT)
Received: from [192.168.3.217] (c-73-241-217-19.hsd1.ca.comcast.net.
 [73.241.217.19])
 by smtp.gmail.com with ESMTPSA id p11sm11877708pgn.65.2021.06.08.09.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 09:24:00 -0700 (PDT)
Subject: Re: [PATCH 03/16] bvec: fix the include guards for bvec.h
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-4-hch@lst.de>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <c5e460da-1401-30c3-df87-0a033f40e563@acm.org>
Date: Tue, 8 Jun 2021 09:23:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210608160603.1535935-4-hch@lst.de>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/8/21 9:05 AM, Christoph Hellwig wrote:
> Fix the include guards to match the file naming.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
