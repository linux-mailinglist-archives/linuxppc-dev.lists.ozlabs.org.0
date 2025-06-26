Return-Path: <linuxppc-dev+bounces-9796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFE5AE9329
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 02:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSJmJ6WwDz2xYl;
	Thu, 26 Jun 2025 10:02:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::536"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750896176;
	cv=none; b=KlwSihipkW2jBzrmKxY47xRx3/X1LUP/l5FjbI0r98/CGdaJWAAHvnTwWoK98QdxEkazGV1hxXnbIb8dTaPGeBkOkrnw2DqAXewCrSFGDeYgCvZ+8A8jssgqfk8H/loT364WR36WNkY8kEdr4egynZq9ghZoJgwnI8gVkgXDTUMMEdu6XSdRgYZXXhj1Ba57/fiphBlf5cnIgUxWDikrSVmbLlS1djcqM3pwJqMOiiS2q022pklJfQ/Rtz8YoSsw7GG5ZuLzUe3vJ6l3W+vEOe/d6kQtwcp+Q889mr1MiD9PqIpZn/diAuzv1r0D0Wi72orSFfZA4hwYNrHgFxUpyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750896176; c=relaxed/relaxed;
	bh=lM1GTPPHV5WCR55djJT3W1q00iOrpCxrYOZ6QlrYZ6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYqf9IUrPnwdzclYEzk1jtz9lSTZPJNAh1QL+4Fo2G4NTzQWM6v/mklBUWjS0l5dfRVGW6N6cI/H+y814ihfox2lX4XpLY2/SNSuknbhYBPsmxsi3YfFwBcANRMIUXmB0zzLJDCuMnBkUtY3VaLJtCx7w0ri+4pekOKjf/vygMOHSKGIDuyDrKQHP197APJ7f+c8wy0gwEUfXz0H6d2suAHe1PeOCETZxV39K11+ULocVyq1i2WKsUhCgiRwF60T0vbwEtfLZM+Gyb1PfQYgmXl5V+wCFLoGuOjluVmPEes8sC/VJJnxw8mHRSjUcTys2Zq0NUgIbPtBdOjxrdBe3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EF2baae6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EF2baae6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSJmH5HVDz2xRt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 10:02:54 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b34c068faf8so432058a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750896173; x=1751500973; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lM1GTPPHV5WCR55djJT3W1q00iOrpCxrYOZ6QlrYZ6A=;
        b=EF2baae6KxXwqwz6QoEFVI/8Cg7ZdHjs4O5BvWchddSCKA7HJ9qV+1Pt30CRQxSIeY
         hJS6ih7OGYdUTx9Z0Gb71BDcr3g1+I4rZ4M4Xp3XIVZv5vS+8vffTC0zwoMAXB0YkJyO
         uRJsBTY7Ru0Kk9GCj1E8v2c2jdzen6AmN/Fjtv8+6aihvdXO4ZltihtB2OlUNN9Gtavv
         noedK1IOzRB0/Yvt/IW22Uf65+5giWBMkDDol5Br2w1JkPLb0TxzQNBR59WP05/Ish9q
         oUMgq72Kz5PSHbmOzUCWCYgya2YLIqiKCvpDM+gPUvssidYu6XgdY7+7wLeGJlVsEokd
         NVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896173; x=1751500973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lM1GTPPHV5WCR55djJT3W1q00iOrpCxrYOZ6QlrYZ6A=;
        b=EIhv5mcBMinCOIOh2U7sSXCxUVM4EJq5hIjNW04wKBImDXeBSX1qlV+beH6yJpjISn
         EI56DX3DIk967VZsqlZchVdYFaDJMSUkR/3Z3ApuD/Rh2FpK1HKa+PXaBVzS3sZ5R2Wq
         dKlKvGrT+1d6ofxKOGxWLWErIN98SkOM5WYdn2SKXUnZFptraRiv9VYiQJMYCtnDsB8A
         X8wF4vPcqEkIGV6q+qwfNt6rtCvhz5cgIcn+947jHMMMsWiOEigWkIpwDaR40RYBvhts
         RjXhiLHrE3yjPggPt1j9XaHT+7dJPp2C1AMjAI84J/sGMg4jHH8vPe09pUQIT28HQBe9
         NeCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmKgpiJ2MeA5ug0uhBy+DmD2PUghFbf2zSfWho5ess896bWF9IBLNXjK951I14q4vXUM/IfwUWcaV0KN0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YywJTmKpo8ZZPhejCIRN0He0M4hLv8/AAKw4I1dva6zOuDvjA5q
	CR7QlJvBxoe5iwDSFcYedp5XBZmEQPMJKub5BR/21SajqtBGTAAA4ij0
X-Gm-Gg: ASbGncuiFA8iMPLkKl9T1qrzZ/ED02Nj0r2nHZAMdBkR1zkg1hJYmHk3OXMLF4uVWoc
	w2T2ZDpJuxDPCT1Ywp8RAfBleX8Jiwgo3WR9rl1FzRK473yXynxoQry5I4Cs9n951ThjLvr0X2r
	SGHB1BPqCost9wfliTSf1angbfl21W7gSv5OLtpyLLB84t45UnBjl6rAMQeMS2kDs2flqoi6Qtd
	kULngiVjcPSnskt5Q8brW0zyI9rT8l8/z7OvNhW4xGlT+5PRgY2dvzvX4mBeGafP8MyqlwrBMYC
	OjhWYudZPnvX93CJ/73cSbsiyad80lggrdmQiF/yzQZNMPnDlBa6yd3PwGl/zQ==
X-Google-Smtp-Source: AGHT+IHBlphPYG0R+Ezs3voKgmJntm9TCYEj5igU5EvDXw9i4W7TFCoT1JCE5a9iA/KumVZ68cBqOg==
X-Received: by 2002:a05:6a20:d74d:b0:21f:f0b6:3d6d with SMTP id adf61e73a8af0-2207f19208amr6650183637.10.1750896172980;
        Wed, 25 Jun 2025 17:02:52 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c88722e7sm5414333b3a.166.2025.06.25.17.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:02:52 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:02:50 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Subject: Re: [RFC v2 4/9] sched/fair: Don't use CPU marked as avoid for
 wakeup and load balance
Message-ID: <aFyOITguo83GdxKv@yury>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-5-sshegde@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625191108.1646208-5-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 12:41:03AM +0530, Shrikanth Hegde wrote:
> Load balancer shouldn't spread CFS tasks into a CPU marked as Avoid. 
> Remove those CPUs from load balancing decisions. 
> 
> At wakeup, don't select a CPU marked as avoid. 
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> while tesing didn't see cpu being marked as avoid while new_cpu is. 
> May need some more probing to see if even cpu can be. if so it could
> lead to crash.  
> 
>  kernel/sched/fair.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 7e2963efe800..406288aef535 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8546,7 +8546,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	}
>  	rcu_read_unlock();
>  
> -	return new_cpu;
> +	/* Don't select a CPU marked as avoid for wakeup */
> +	if (cpu_avoid(new_cpu))
> +		return cpu;
> +	else
> +		return new_cpu;
> +
>  }

There are more 'return's in this function, but you patch only one...

>  
>  /*
> @@ -11662,6 +11667,9 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>  
>  	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
>  
> +	/* Don't spread load into CPUs marked as avoid */
> +	cpumask_andnot(cpus, cpus, cpu_avoid_mask);
> +
>  	schedstat_inc(sd->lb_count[idle]);
>  
>  redo:
> -- 
> 2.43.0

