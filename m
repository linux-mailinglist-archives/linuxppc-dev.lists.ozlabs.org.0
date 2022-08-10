Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CDE58E4B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 03:53:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2Xyq3lcbz3btQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 11:53:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TVp4hTLO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TVp4hTLO;
	dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2Xy85Ff8z2xGm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 11:52:46 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id d7so12986513pgc.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Aug 2022 18:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc;
        bh=uJ7GwENNd8S7JogVNXQkjFeXcZon4dSzrvy2NCKTjyo=;
        b=TVp4hTLOYrSLO8reO48JuIZJTSTLi+o0wyhWtkWVzKzDI8p7rKZOXI6CYBKZ+a693D
         67kShbLy6i5zSflpom/GzMOZby6Ia0UAYVB7qPlwgKqcJtZ5L979HrjVEL/9Q1kAnTsH
         DOHi2Jc2F/2yGFpG22nKSlFBkWL4D4fDAGSEcLDX8nSynTyN27QPjgkxomJb22UQeFty
         vb+bVoa2ZFOo6Qj4sM0SSGecNFZ3X94K8l9bKxrNWaqHpp58THCGqIerCkhSxbqVCbyT
         1u2L2+AIkg/eCB45DOQ1crFkN5DtkjDmi9Uj0jB399QQ9+1kse8w7DFPOHmjjBpKBr66
         teyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc;
        bh=uJ7GwENNd8S7JogVNXQkjFeXcZon4dSzrvy2NCKTjyo=;
        b=wxUkeZ5SVsqLReckbCKmWs1xvJ+Iv9LunpnhK/mV+6wQ766XuIl+ZNRBE4RxPPFbmJ
         Fke99UuEr+BYvQxWKmgZ0FPheMlfZTKwR9ZiVn39MXcMNNYimzgj6Oc5avVI3IaVg2EM
         nxMvjbS7rbg4c6Mntc02/AVENbcP8V1pmYWm0BT1VeJMw10C4/F/J1pVtPUhoojTOn2L
         9ZolWWI9Du6FqvS1UrlbPxQR9PuHp98cLt1NJCp/7bSrbvZFDuCyRXF51TL7fRm1VvAX
         rvHmv+b0RXHi3UTgbKzc9kWawIGc71hSZyg2JN8vVfrNH/3cCSOX7v4Bqw8plBOVkWO0
         qLNQ==
X-Gm-Message-State: ACgBeo0n9qID8SlCn3p/b9bL6kLJEe6qHRC4X622kpOVYhvs+OFCtU8C
	jv+i6BS9mSulaL6ZVKKLE2c=
X-Google-Smtp-Source: AA6agR5KMxIQb3mKpS6FDRSB8hYboI4e3L5/gn04wTr9qQVT1KIeqA66A0Zx3TTmftvQ5m98IXrcBA==
X-Received: by 2002:a63:4e25:0:b0:41c:62a2:ecc3 with SMTP id c37-20020a634e25000000b0041c62a2ecc3mr21548384pgb.596.1660096363741;
        Tue, 09 Aug 2022 18:52:43 -0700 (PDT)
Received: from tee480 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
        by smtp.googlemail.com with ESMTPSA id y202-20020a6264d3000000b0052f2bc783basm546297pfb.117.2022.08.09.18.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 18:52:42 -0700 (PDT)
Message-ID: <0e3ea5733bd786a4dea43a53ebd59b93d97ad036.camel@gmail.com>
Subject: Re: [PATCH 01/17] powerpc/qspinlock: powerpc qspinlock
 implementation
From: Jordan NIethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 10 Aug 2022 11:52:39 +1000
In-Reply-To: <20220728063120.2867508-2-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-2-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-7"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-07-28 at 16:31 +-1000, Nicholas Piggin wrote:
+ADw-snip+AD4
+AD4 -+ACM-define queued+AF8-spin+AF8-lock queued+AF8-spin+AF8-lock
+AD4  
+AD4 -static inline void queued+AF8-spin+AF8-unlock(struct qspinlock +ACo-lock)
+AD4 +-static +AF8AXw-always+AF8-inline int queued+AF8-spin+AF8-trylock(struct qspinlock +ACo-lock)
+AD4  +AHs
+AD4 -	if (+ACE-IS+AF8-ENABLED(CONFIG+AF8-PARAVIRT+AF8-SPINLOCKS) +AHwAfA +ACE-is+AF8-shared+AF8-processor())
+AD4 -		smp+AF8-store+AF8-release(+ACY-lock-+AD4-locked, 0)+ADs
+AD4 -	else
+AD4 -		+AF8AXw-pv+AF8-queued+AF8-spin+AF8-unlock(lock)+ADs
+AD4 +-	if (atomic+AF8-cmpxchg+AF8-acquire(+ACY-lock-+AD4-val, 0, 1) +AD0APQ 0)
+AD4 +-		return 1+ADs
+AD4 +-	return 0+ADs

optional style nit: return (atomic+AF8-cmpxchg+AF8-acquire(+ACY-lock-+AD4-val, 0, 1) +AD0APQ 0)+ADs

