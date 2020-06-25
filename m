Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1AF209B89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 10:52:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sv0f3362zDqm9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 18:52:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zwcL9Y65; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49styq4dGSzDqkq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 18:50:57 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id cv18so356380pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 01:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JEMoZdpFmrFhFcFBcdt9FFDGd+0A8OhsnWsQtV3mDFY=;
 b=zwcL9Y65FiPLi2vjuyj40QyTUjgv3aeO4hIU2vSpY+ujIZWGaNlfkCfdnIbFsNxo0H
 s2bxZH7BVoYdiRgMEO/Vg6ESWbMhb3nv/KAEMF1vtI/9xGSuo+SXo03llv+PmHWmUC8n
 2Fuh04JomaNSCobeuTTpqT4sCG7KY1xn0mKHLmWhjxI/XPEc/dehP6bUzCl0o7UY9Xxk
 gP27jOnkzXmkF6VH+uuxfwPM1NkKvSVA28LRw3MgNoRtiU2Pfr7WPki43eagX+zgnSVT
 PqOmYzAJqDo2V2tahpUFRzZbvkj5DnYF48KOvH3PCv7nYdSDRdi4B74G+fWo74pp9cMm
 mZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JEMoZdpFmrFhFcFBcdt9FFDGd+0A8OhsnWsQtV3mDFY=;
 b=IIDsZGZhX0AF4MxXgi0iJQAUHUQUw1JVMit9v6fUiimAvk3Lw1mnYoMGHZS9n55gjl
 kSBmQYOqP4jWtDNVNVXCnuhdXImc9/V1H+XJYpLSjjs0zoNSU45KPcRdq49labXfiYDm
 TKwXLxin3q4eJ+lN6qShdRI8RIFtuSWXghB5j6aBp0zePK+CT4TLHrAhMpJpgUJun5Wd
 RWifdajQCGrYGIig6/qkVornH/q0wTQSmWqert6qHkpZhYiAlkUS3YioZITiBa0w1jyK
 Y8rLzK5t72n8DUtc9m5iAIw30nuGYz4XnYa7f5LKm6+5bQLjHWZ7MJl23dxefd6EfCgn
 i8pA==
X-Gm-Message-State: AOAM533MgOhVF0UCUi/iI5WQykw4IaWX9nI3UnwsqDPPIk1H8Aq6LYDZ
 o6P7HFxtuC+7G28JSg6ztw+M9Q==
X-Google-Smtp-Source: ABdhPJzHllegdQIG8KbY6WzYzQnZ64LxOSyUGGS4GTbuRzkA6CihktIRU3UyCCXiZkNESNztdGrrfg==
X-Received: by 2002:a17:90a:74cb:: with SMTP id
 p11mr2162481pjl.89.1593075055236; 
 Thu, 25 Jun 2020 01:50:55 -0700 (PDT)
Received: from localhost ([122.172.111.76])
 by smtp.gmail.com with ESMTPSA id s9sm19347192pgo.22.2020.06.25.01.50.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 01:50:54 -0700 (PDT)
Date: Thu, 25 Jun 2020 14:20:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v2 2/2] cpufreq: Specify default governor on command line
Message-ID: <20200625085052.4ah4wbog3guj74v4@vireshk-i7>
References: <20200623142138.209513-1-qperret@google.com>
 <20200623142138.209513-3-qperret@google.com>
 <20200624055023.xofefhohf7wifme5@vireshk-i7>
 <CAJZ5v0ja_rM7i=psW1HRyzEpW=8QwP2u9p+ihN3FS8_53bbxTQ@mail.gmail.com>
 <20200624153259.GA2844@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624153259.GA2844@google.com>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 "Cc: Android Kernel" <kernel-team@android.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 adharmap@codeaurora.org, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Todd Kjos <tkjos@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24-06-20, 16:32, Quentin Perret wrote:
> Right, but I must admit that, looking at this more, I'm getting a bit
> confused with the overall locking for governors :/
> 
> When in cpufreq_init_policy() we find a governor using
> find_governor(policy->last_governor), what guarantees this governor is
> not concurrently unregistered? That is, what guarantees this governor
> doesn't go away between that find_governor() call, and the subsequent
> call to try_module_get() in cpufreq_set_policy() down the line?
> 
> Can we somewhat assume that whatever governor is referred to by
> policy->last_governor will have a non-null refcount? Or are the
> cpufreq_online() and cpufreq_unregister_governor() path mutually
> exclusive? Or is there something else?

This should be sufficient to fix pending issues I believe. Based over your
patches.

-- 
viresh

-------------------------8<-------------------------
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 25 Jun 2020 13:15:23 +0530
Subject: [PATCH] cpufreq: Fix locking issues with governors

The locking around governors handling isn't adequate currently. The list
of governors should never be traversed without locking in place. Also we
must make sure the governor isn't removed while it is still referenced
by code.

Reported-by: Quentin Perret <qperret@google.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 59 ++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 4b1a5c0173cf..dad6b85f4c89 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -624,6 +624,24 @@ static struct cpufreq_governor *find_governor(const char *str_governor)
 	return NULL;
 }
 
+static struct cpufreq_governor *get_governor(const char *str_governor)
+{
+	struct cpufreq_governor *t;
+
+	mutex_lock(&cpufreq_governor_mutex);
+	t = find_governor(str_governor);
+	if (!t)
+		goto unlock;
+
+	if (!try_module_get(t->owner))
+		t = NULL;
+
+unlock:
+	mutex_unlock(&cpufreq_governor_mutex);
+
+	return t;
+}
+
 static unsigned int cpufreq_parse_policy(char *str_governor)
 {
 	if (!strncasecmp(str_governor, "performance", CPUFREQ_NAME_LEN))
@@ -643,28 +661,14 @@ static struct cpufreq_governor *cpufreq_parse_governor(char *str_governor)
 {
 	struct cpufreq_governor *t;
 
-	mutex_lock(&cpufreq_governor_mutex);
-
-	t = find_governor(str_governor);
-	if (!t) {
-		int ret;
-
-		mutex_unlock(&cpufreq_governor_mutex);
-
-		ret = request_module("cpufreq_%s", str_governor);
-		if (ret)
-			return NULL;
-
-		mutex_lock(&cpufreq_governor_mutex);
+	t = get_governor(str_governor);
+	if (t)
+		return t;
 
-		t = find_governor(str_governor);
-	}
-	if (t && !try_module_get(t->owner))
-		t = NULL;
-
-	mutex_unlock(&cpufreq_governor_mutex);
+	if (request_module("cpufreq_%s", str_governor))
+		return NULL;
 
-	return t;
+	return get_governor(str_governor);
 }
 
 /**
@@ -818,12 +822,14 @@ static ssize_t show_scaling_available_governors(struct cpufreq_policy *policy,
 		goto out;
 	}
 
+	mutex_lock(&cpufreq_governor_mutex);
 	for_each_governor(t) {
 		if (i >= (ssize_t) ((PAGE_SIZE / sizeof(char))
 		    - (CPUFREQ_NAME_LEN + 2)))
-			goto out;
+			break;
 		i += scnprintf(&buf[i], CPUFREQ_NAME_PLEN, "%s ", t->name);
 	}
+	mutex_unlock(&cpufreq_governor_mutex);
 out:
 	i += sprintf(&buf[i], "\n");
 	return i;
@@ -1060,11 +1066,14 @@ static int cpufreq_init_policy(struct cpufreq_policy *policy)
 {
 	struct cpufreq_governor *gov = NULL;
 	unsigned int pol = CPUFREQ_POLICY_UNKNOWN;
+	bool put_governor = false;
+	int ret;
 
 	if (has_target()) {
 		/* Update policy governor to the one used before hotplug. */
-		gov = find_governor(policy->last_governor);
+		gov = get_governor(policy->last_governor);
 		if (gov) {
+			put_governor = true;
 			pr_debug("Restoring governor %s for cpu %d\n",
 				 policy->governor->name, policy->cpu);
 		} else if (default_governor) {
@@ -1091,7 +1100,11 @@ static int cpufreq_init_policy(struct cpufreq_policy *policy)
 			return -ENODATA;
 	}
 
-	return cpufreq_set_policy(policy, gov, pol);
+	ret = cpufreq_set_policy(policy, gov, pol);
+	if (put_governor)
+		module_put(gov->owner);
+
+	return ret;
 }
 
 static int cpufreq_add_policy_cpu(struct cpufreq_policy *policy, unsigned int cpu)
